#!/bin/bash
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

# gem install bundler
bundle install
npm install

bundle exec middleman build
# bundle exec middleman deploy
bundle exec middleman server
