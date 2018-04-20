#!/bin/bash

yarn add web-animations-js
yarn add karma-phantomjs-launcher phantomjs-prebuilt --dev

cp $STARTER_DIRECTORY/resources/polyfills.ts ./src/

sed -i '' "s/karma-chrome-launcher/karma-phantomjs-launcher/g" karma.conf.js
sed -i '' "s/Chrome/PhantomJS/g" karma.conf.js

yarn remove karma-chrome-launcher
