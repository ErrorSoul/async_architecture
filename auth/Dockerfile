FROM ruby:3.0.2-alpine
ENV RAILS_ENV development


RUN apk add --update build-base libxml2-dev libxslt-dev postgresql-dev tzdata less git yarn shared-mime-info
RUN rm -rf /var/cache/apk/*

RUN bundle config build.nokogiri --use-system-libraries

RUN mkdir /app
WORKDIR /app
# RUN addgroup -S docker
# RUN adduser \
#     --disabled-password \
#     --gecos "" \
#     --home $home \
#     --ingroup docker \
#     $user
# WORKDIR $home
# USER $user
# RUN chown -R $user /app && \
#     chmod 2777 -R $user /app

# Create a group and user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Tell docker that all future commands should run as the appuser user

COPY . /app
RUN chown -R appuser /app
USER appuser
RUN bundle config set --local without 'development test'
RUN bundle install --without development test
# RUN yarn install --check-files
#RUN SECRET_KEY_BASE=`rake secret` bundle exec rails assets:precompile

#EXPOSE 3000
