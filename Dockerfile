FROM ruby:2.1.3
MAINTAINER Steven Harman <steven@harmanly.com>

RUN apt-get update \
    && apt-get install -y node \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV RACK_ENV production

COPY . /usr/src
WORKDIR /usr/src

RUN bundle --deployment
RUN bundle exec rake generate

EXPOSE 80
CMD bundle exec thin start -R config.ru -e $RACK_ENV -p 80
