#!/bin/bash

npm i web-animations-js --save
npm i karma-phantomjs-launcher phantomjs-prebuilt --save-dev

cp $STARTER_DIRECTORY/resources/polyfills.ts ./src/

sed -i '' "s/karma-chrome-launcher/karma-phantomjs-launcher/g" karma.conf.js
sed -i '' "s/Chrome/PhantomJS/g" karma.conf.js

npm uninstall karma-chrome-launcher --save
