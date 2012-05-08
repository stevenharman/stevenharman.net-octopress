require 'bundler/setup'
require 'rack/rewrite'
require 'sinatra/base'
require 'rack/protection'

# The project root directory
$root = ::File.dirname(__FILE__)

use Rack::Protection, except: :session_hijacking

use Rack::Rewrite do
  r301 %r{.*}, 'http://www.stevenharman.net$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != 'www.stevenharman.net' && ENV['RACK_ENV'] == 'production'
  }

  r301 %r{^/blog/default\.aspx$}i, '/'
  r301 %r{^/blog/archives\.aspx$}i, '/archives'
  r301 %r{^/blog/archive/\d{4}/\d{2}/\d{2}/(.+)\.aspx$}i, '/$1'
  r301 %r{^(.+)/$}, '$1' # strip tailing slashes
  r301 %r{^/atom$}i, '/atom.xml'
end

class SinatraStaticServer < Sinatra::Base
  set :public_folder, 'public'

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_sinatra_file('404.html') {"Sorry, I cannot find #{request.path}"}
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer
