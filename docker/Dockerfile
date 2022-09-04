FROM ruby:2.7.4-bullseye

RUN apt-get update && apt-get -y install libcurl4-openssl-dev libvips
RUN curl -sSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

ENV RAILS_ENV=production

RUN mkdir /app
WORKDIR /app

RUN git clone --branch openid-connect-auth --depth 1 https://github.com/stgm/course-site.git 

WORKDIR /app/course-site

COPY init.sh /app/course-site/

RUN gem install bundler:1.17.2

RUN bundle install

RUN SECRET_KEY_BASE=dummyvalue bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

ENTRYPOINT [ "/app/course-site/init.sh" ]