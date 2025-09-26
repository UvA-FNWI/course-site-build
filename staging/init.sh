#!/bin/sh

# reset the database to blank
bin/rails db:reset
# bin/rails db:prepare

# clear caches
bin/rails tmp:clear

# start Solid Queue job processor in the background
# bundle exec rake solid_queue:start &

# start application server
bin/rails server
