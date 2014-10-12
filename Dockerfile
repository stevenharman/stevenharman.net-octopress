FROM ruby:2.1.3
MAINTAINER Steven Harman <steven@harmanly.com>

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y node \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV RACK_ENV production

WORKDIR /usr/src

COPY Gemfile /usr/src/
COPY Gemfile.lock /usr/src/
RUN bundle install --deployment --without development

COPY . /usr/src

RUN bundle exec rake generate \
    && rm -rf source sass plugins

EXPOSE 80
CMD bundle exec thin start -R config.ru -e $RACK_ENV -p 80
