require 'bundler/setup'
require 'rack/rewrite'
require 'sinatra/base'

# The project root directory
$root = ::File.dirname(__FILE__)

use Rack::Rewrite do
  old_posts = { 'a-first-step-to-better-user-experience-thinking-like-a' => 'a-first-step-to-better-user-experience-thinking-like-a-human',
                'make-money-by-making-getting-paid-easy' => 'want-to-make-money-make-getting-paid-the-easy-part',
                'yagni-ainrsquot-what-you-think-it-is' => 'yagni-aint-what-you-think-it-is',
                'omg-better-rake-for-.net' => 'omg-better-rake-for-dot-net' }

  r301 %r{.*}, 'http://stevenharman.net$&', :if => Proc.new { |rack_env|
    rack_env['SERVER_NAME'] != 'stevenharman.net' && ENV['RACK_ENV'] == 'production'
  }

  r301 %r{^/blog/default\.aspx$}i, '/'
  r301 %r{^/blog/archives\.aspx$}i, '/archives'
  r301 %r{^/blog/archive/\d{4}/\d{2}/\d{2}/(.+)\.aspx$}i, '/$1'
  old_posts.each { |old, new|
    r301 %r{^/#{old}$}i, "/#{new}"
  }
  r301 %r{^(.+)/$}, '$1' # strip tailing slashes
  r301 %r{^/atom$}i, '/atom.xml'
end

class SinatraStaticServer < Sinatra::Base
  set :public_folder, 'public'

  get(/.+/) do
    send_sinatra_file(request.path) {404}
  end

  not_found do
    send_file(File.join(File.dirname(__FILE__), 'public', '404.html'), {:status => 404})
  end

  def send_sinatra_file(path, &missing_file_block)
    file_path = File.join(File.dirname(__FILE__), 'public',  path)
    file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i
    File.exist?(file_path) ? send_file(file_path) : missing_file_block.call
  end

end

run SinatraStaticServer
