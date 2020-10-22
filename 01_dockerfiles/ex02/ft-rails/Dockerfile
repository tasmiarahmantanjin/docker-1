FROM ruby:2.5.1

MAINTAINER ismelich <ismelich@student.hive.fi>

RUN apt-get update && apt-get install -y nodejs
RUN gem install rails --version 5.2.0

RUN mkdir -p /opt/app
COPY app /opt/app

ONBUILD WORKDIR /opt/app
ONBUILD RUN bundle install
ONBUILD RUN rake db:create
ONBUILD RUN rake db:migrate
ONBUILD RUN rake db:seed


# RUN & TEST
# Go inside of the ft_rails (cd ft_rails)
# git clone https://github.com/RailsApps/rails-signup-thankyou.git app
# app folder shold be clone inside of the ft_rails folder
# docker build -t ft-rails:on-build .

# The rails app should be copied to the /opt/app folder. 
# ONBUILD -> Adds to the image a trigger instruction to be executed at a later time, 
# when the image is used as the base for another build. 
# ONBUILD RUN rake -> Create your database, migrate and/or seed(sharing) it.
# Deploy docker containers via Rake. This is especially useful for dockerized 
# Ruby applications.