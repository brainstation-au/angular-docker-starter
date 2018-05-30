#!/bin/bash

npm i web-animations-js --save
npm i karma-phantomjs-launcher phantomjs-prebuilt --save-dev

cp $STARTER_DIRECTORY/resources/polyfills.ts ./src/
cp $STARTER_DIRECTORY/resources/karma.conf.js ./src/
