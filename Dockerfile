FROM ruby:2.1.2

RUN apt-get update

RUN mkdir /offenerrat-ms
WORKDIR /offenerrat-ms
ADD Gemfile /offenerrat-ms/Gemfile
ADD Gemfile.lock /offenerrat-ms/Gemfile.lock
RUN bundle install
ADD . /offenerrat-ms
CMD ["bundle","exec", "rails", "server"]
EXPOSE 3000
