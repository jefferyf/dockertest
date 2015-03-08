FROM ubuntu:14.04
MAINTAINER demo@example.com

RUN apt-get update && apt-get install -y \
  ruby2.0 \
  ruby2.0-dev \
  build-essential \
  python-software-properties \
  software-properties-common \
  git \
  nodejs \
  npm \
  git \
  curl \
  libssl-dev \
  zlib1g-dev\
  libreadline6-dev \
  libyaml-dev \
  libffi-dev \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  libqt4-webkit \
  libqt4-dev \
  libmysqlclient-dev \
  sqlite3 \
  libsqlite3-dev \
  xvfb

RUN gem2.0 install bundler --no-ri --no-rdoc

ADD . /app/

WORKDIR /app
RUN bundle install

EXPOSE 3000
# CMD bundle exec rails s -b 0.0.0.0
ENTRYPOINT bin/start_server.sh