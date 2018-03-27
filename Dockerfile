FROM ruby:2.5

EXPOSE 3000

WORKDIR /app

ENV BUNDLER_VERSION=1.16.1
RUN gem install bundler --no-ri --no-rdoc -v "$BUNDLER_VERSION"

COPY Gemfile /app
COPY Gemfile.lock /app
RUN ls -la
RUN bundle install --deployment --jobs 4

COPY . /app