FROM ruby:2.2.0
MAINTAINER Jeff Miller <jeffery.f@gmail.com>

RUN mkdir -p /var/www/app
WORKDIR /var/www/app

ADD Gemfile /var/www/app/
ADD Gemfile.lock /var/www/app/
RUN bundle install --system

ADD Procfile /var/www/app/

ADD . /var/www/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
ENTRYPOINT bin/start_server.sh
