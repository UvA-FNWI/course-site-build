FROM phusion/passenger-ruby32:2.5.1

# System update and application dependencies
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
RUN apt-get -y install libcurl4-openssl-dev libvips mupdf imagemagick
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true

# Application will be run as non-root user
USER app

# Get application from public repository
WORKDIR /home/app
ADD "https://api.github.com/repos/stgm/course-site/commits/2022" last-commit
RUN git clone --branch 2022 --depth 1 https://github.com/stgm/course-site.git

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
