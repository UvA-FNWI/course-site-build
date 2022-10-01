#!/bin/sh

bin/rails db:reset
bin/rails tmp:clear
passenger start
