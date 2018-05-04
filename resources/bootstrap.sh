#!/bin/bash

npm i bootstrap --save
echo "Please add jquery and popper CDN in the index.html file."

cp -r $STARTER_DIRECTORY/resources/styles/bootstrap ./src/styles/
echo "@import './styles/bootstrap/bootstrap';" >> ./src/styles.scss
