FROM ruby:3.1.2-bullseye

RUN apt-get update && apt-get -y install libcurl4-openssl-dev libvips

ENV RAILS_ENV=production

RUN mkdir /app
WORKDIR /app

ADD "https://api.github.com/repos/stgm/course-site/commits/staging" last-commit

RUN git clone --branch staging --depth 1 https://github.com/stgm/course-site.git 

WORKDIR /app/course-site

COPY init.sh /app/course-site/

RUN bundle install

RUN SECRET_KEY_BASE=dummyvalue bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

ENTRYPOINT [ "/app/course-site/init.sh" ]
