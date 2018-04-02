#!/bin/bash

yarn add @angular/material @angular/cdk @angular/animations hammerjs

cp -r $STARTER_DIRECTORY/resources/styles/material ./src/styles/
echo "@import './styles/material/material';" >> ./src/styles.scss
