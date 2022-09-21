#!/bin/sh

bin/rails db:prepare
passenger start
