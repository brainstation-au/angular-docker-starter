#!/bin/bash

yarn add bootstrap "jquery@1.9.1 - 3" "popper.js@^1.12.9"

cp -r $STARTER_DIRECTORY/resources/styles/bootstrap ./src/styles/
echo "@import './styles/bootstrap/bootstrap';" >> ./src/styles.scss
