#!/bin/bash
set -x

if [ -z "$(node --version)" ]; then
  echo "Please install nvm with `brew install nvm`"
  exit 1
fi

if [ -z "$(jq --version)" ]; then
  echo "Please install jq with `brew install jq`"
  exit 1
fi

nvm install 8
npm i -g npm
npm i -g yarn @angular/cli

export $(egrep -v '^#' .env | xargs)

if [ -z $PROJECT_NAME ] || [ -z $LOCAL_HOST ] || [ -z $ANGULAR_PORT ] || [ -z $KARMA_PORT ]; then
  echo ".env file doesn't have all the required values"
  exit 1
fi

ng new $PROJECT_NAME --style=scss
cd $PROJECT_NAME && yarn install && cd ..

. ./resources/bootstrap.sh
. ./resources/docker.sh
. ./resources/phantomjs.sh
