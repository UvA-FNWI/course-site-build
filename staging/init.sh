#!/bin/sh

# bin/rails db:reset
bin/rails db:prepare
bin/rails tmp:clear
passenger start
