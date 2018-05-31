#!/bin/bash

npm i web-animations-js --save
npm i karma-phantomjs-launcher phantomjs-prebuilt --save-dev

cp $STARTER_DIRECTORY/resources/polyfills.ts ./src/
cp $STARTER_DIRECTORY/resources/karma.conf.js ./src/
cp $STARTER_DIRECTORY/resources/protractor.conf.js ./e2e/

cp $STARTER_DIRECTORY/resources/Dockerfile ./
cp $STARTER_DIRECTORY/resources/docker-compose.yml ./

sed -i '' "s/__PROJECT_NAME__/${PROJECT_NAME}/g" Dockerfile
sed -i '' "s/__PROJECT_NAME__/${PROJECT_NAME}/g" docker-compose.yml

sed -i '' "s/__ANGULAR_PORT__/${ANGULAR_PORT}/g" Dockerfile
sed -i '' "s/__ANGULAR_PORT__/${ANGULAR_PORT}/g" docker-compose.yml

sed -i '' "s/__KARMA_PORT__/${KARMA_PORT}/g" Dockerfile
sed -i '' "s/__KARMA_PORT__/${KARMA_PORT}/g" docker-compose.yml

sed -i '' "s/__DOMAIN__/${DOMAIN}/g" Dockerfile
sed -i '' "s/__DOMAIN__/${DOMAIN}/g" docker-compose.yml

touch ./.dockerignore
echo "*" >> ./.dockerignore

FILE="./package.json"

PACKAGE=$(cat $FILE | jq '.')

SCRIPTS=$(jq '.scripts' <<<$PACKAGE)

NEW_SCRIPTS=$(jq ". + {
\"serve\": \"ng serve --host 0.0.0.0 --public-host ${LOCAL_HOST}:${ANGULAR_PORT}\",
\"test:docker\": \"xvfb-run ng test --browsers=ChromeHeadless,PhantomJS\",
\"test:docker:watch\": \"xvfb-run ng test --watch=true --browsers=ChromeHeadless,PhantomJS\",
\"e2e:docker\": \"xvfb-run ng e2e --port=8080\",
\"build:prod\": \"ng build --prod --aot\"
}" <<<$SCRIPTS)

NEW_PACKAGE=$(jq ".scripts = ${NEW_SCRIPTS}" <<<$PACKAGE)

NEW_PACKAGE2=$(jq ". + {\"engines\":{\"node\":\"8.11.2\",\"npm\":\"5.6.0\"}}" <<<$NEW_PACKAGE)

jq '.' <<<$NEW_PACKAGE2 > $FILE
