#!/bin/bash

yarn add web-animations-js karma-phantomjs-launcher phantomjs-prebuilt

cp $STARTER_DIRECTORY/resources/polyfills.ts ./src/

sed -i '' "s/karma-chrome-launcher/karma-phantomjs-launcher/g" karma.conf.js
sed -i '' "s/Chrome/PhantomJS/g" karma.conf.js

yarn remove karma-chrome-launcher
