#!/bin/sh

# update database schema or initialize new database
bin/rails db:prepare

# start Solid Queue job processor in the background
bin/jobs &

# start application server
passenger start
