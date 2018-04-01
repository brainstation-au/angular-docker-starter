#!/bin/bash

cd $PROJECT_NAME

yarn add bootstrap
cp -r ../resources/styles ./src/
echo "" >> ./src/styles.scss
echo "@import './styles/bootstrap/bootstrap';" >> ./src/styles.scss
echo "@import './styles/app/app';" >> ./src/styles.scss

cd ..
