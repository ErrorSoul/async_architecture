FROM ruby:3.0.2-alpine
ENV RAILS_ENV development


RUN apk add --update build-base libxml2-dev libxslt-dev postgresql-dev tzdata less git yarn shared-mime-info
RUN rm -rf /var/cache/apk/*

RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir /app
WORKDIR /app

COPY . /app
RUN bundle install --without development test
RUN yarn install --check-files
RUN SECRET_KEY_BASE=`rake secret` bundle exec rails assets:precompile

EXPOSE 3000
