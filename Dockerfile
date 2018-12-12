FROM ruby:2.5.1-alpine

RUN apk update \
        && apk add \
            net-tools \
            build-base \
            mysql-client \
            nodejs \
            tzdata \
            mysql-dev

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN gem install tzinfo-data
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]