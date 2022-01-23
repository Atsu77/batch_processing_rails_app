FROM ruby:3.0

# yarnのインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN apt-get update && apt-get install -y nodejs postgresql-client

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . ./