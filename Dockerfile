FROM ruby:2.4.2
ADD Gemfile* /
RUN bundle install