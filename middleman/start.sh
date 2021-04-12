#!/bin/bash
set -ex

if [ -n "$REPO" ]; then
  git clone -b $BRANCH $REPO
  SHORT=${REPO##*/}
  DIR=${SHORT%.*}
  cd $DIR
else
  cd /opt
fi

export LC_ALL=C.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
unset BUNDLER_VERSION

if [ -f "Gemfile.lock" ]; then
  gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
else
  gem install bundler
fi
bundle install
npm install

bundle exec middleman build
# bundle exec middleman deploy
bundle exec middleman server
