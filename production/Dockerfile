ARG RUBY_VERSION=4.0.10
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# System packages for building and running the application and Passenger
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential ca-certificates curl git imagemagick libcurl4-openssl-dev \
      libpcre2-dev libssl-dev libvips libyaml-dev mupdf pkg-config procps sqlite3 zlib1g-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

# Application will be run as non-root user
RUN groupadd --system --gid 1000 app && \
    useradd app --uid 1000 --gid 1000 --create-home --shell /bin/bash
USER app

# Install Passenger and download its standalone server runtime
RUN gem install passenger --no-document && \
    passenger-config install-standalone-runtime --auto --nginx-version=1.30.7 && \
    passenger-config build-native-support

# Get application from public repository
WORKDIR /home/app
ADD "https://api.github.com/repos/stgm/course-site/commits/main" last-commit
RUN git clone --branch main --depth 1 https://github.com/stgm/course-site.git

# Add production-specific configuration
COPY --chown=app:app init.sh /home/app/course-site
COPY --chown=app:app Passengerfile.json /home/app/course-site

# Install Rails application dependencies
WORKDIR /home/app/course-site
RUN bundle config set --local without 'development'
RUN bundle install

# Compile application assets
RUN SECRET_KEY_BASE=dummyvalue bundle exec rake assets:precompile

ENTRYPOINT [ "/home/app/course-site/init.sh" ]
