#!/bin/sh

bin/rails db:reset
passenger start
