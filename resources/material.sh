#!/bin/bash

npm i @angular/material @angular/cdk @angular/animations hammerjs --save
echo "Please add \'import 'hammerjs';\' in your main.ts file."

cp -r $STARTER_DIRECTORY/resources/styles/material ./src/styles/
echo "@import './styles/material/material';" >> ./src/styles.scss
