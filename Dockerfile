FROM ruby:2.5

EXPOSE 3000

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app
RUN ls -la
RUN bundle install --deployment --jobs 4

COPY . /app