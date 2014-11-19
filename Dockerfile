FROM ruby:2.1.2

RUN apt-get update

RUN mkdir /offenerrat-ms
WORKDIR /offenerrat-ms
ADD Gemfile /offenerrat-ms/Gemfile
ADD Gemfile.lock /offenerrat-ms/Gemfile.lock
RUN bundle install
ADD . /offenerrat-ms

# Set UTF-8 locale
RUN apt-get install locales && \
    locale-gen C.UTF-8 && \
    update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

CMD ["bundle","exec", "rails", "server"]
EXPOSE 3000
