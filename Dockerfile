FROM ruby:2.4.2
ADD Gemfile* /
RUN bundle install
RUN apt-get update && apt-get install -y python-pygments python-docutils locales
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.utf8
ENV LANG en_US.UTF-8