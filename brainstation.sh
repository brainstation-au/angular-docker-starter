#!/bin/bash
set -x

if [[ $(node --version) != v10* ]]; then
  echo "Please install latest version of node 8."
  echo "\`brew install nvm\`"
  echo "\`nvm install 8\`"
  exit 1
fi

if [ -z "$(jq --version)" ]; then
  echo "Please install jq with \`brew install jq\`"
  exit 1
fi

export $(egrep -v '^#' .env | xargs)

if [ -z $PROJECT_NAME ] || [ -z $LOCAL_HOST ] || [ -z $ANGULAR_PORT ] || [ -z $KARMA_PORT ] || [ -z $DOMAIN ]; then
  echo ".env file doesn't have all the required values"
  exit 1
fi

if [ -d "../$PROJECT_NAME" ]; then
  echo "You already have a \`${PROJECT_NAME}\` directory exists in the parent directory."
  exit 1
fi

npm i -g @angular/cli
ng config -g cli.packageManager npm

# Move to parent directory.
STARTER_DIRECTORY=$(pwd)
cd ..

# Install fresh @angular/cli project.
ng new $PROJECT_NAME --style=scss
cd $PROJECT_NAME

# Styles
mkdir ./src/styles
echo "" >> ./src/styles.scss
if [[ $BOOTSTRAP == TRUE ]]; then
  . $STARTER_DIRECTORY/resources/bootstrap.sh
fi
if [[ $MATERIAL == TRUE ]]; then
  . $STARTER_DIRECTORY/resources/material.sh
fi
cp -r $STARTER_DIRECTORY/resources/styles/app ./src/styles/
echo "@import './styles/app/app';" >> ./src/styles.scss

# Docker
. $STARTER_DIRECTORY/resources/docker.sh

rm -rf node_modules
rm package-lock.json

cd $STARTER_DIRECTORY
