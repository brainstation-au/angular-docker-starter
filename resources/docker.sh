#!/bin/bash

cp $STARTER_DIRECTORY/resources/karma.conf.js ./
cp $STARTER_DIRECTORY/resources/protractor.conf.js ./e2e/

cp $STARTER_DIRECTORY/resources/Dockerfile ./
cp $STARTER_DIRECTORY/resources/docker-compose.yml ./

sed -i '' "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" Dockerfile
sed -i '' "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" docker-compose.yml
sed -i '' "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" karma.conf.js

sed -i '' "s/{{ANGULAR_PORT}}/${ANGULAR_PORT}/g" Dockerfile
sed -i '' "s/{{ANGULAR_PORT}}/${ANGULAR_PORT}/g" docker-compose.yml

sed -i '' "s/{{KARMA_PORT}}/${KARMA_PORT}/g" Dockerfile
sed -i '' "s/{{KARMA_PORT}}/${KARMA_PORT}/g" docker-compose.yml

sed -i '' "s/{{DOMAIN}}/${DOMAIN}/g" Dockerfile
sed -i '' "s/{{DOMAIN}}/${DOMAIN}/g" docker-compose.yml

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
\"build:prod\": \"ng build --prod\"
}" <<<$SCRIPTS)

NEW_PACKAGE=$(jq ".scripts = ${NEW_SCRIPTS}" <<<$PACKAGE)

NEW_PACKAGE2=$(jq ". + {\"engines\":{\"node\":\"10.16\",\"npm\":\"6.9\"}}" <<<$NEW_PACKAGE)

jq '.' <<<$NEW_PACKAGE2 > $FILE
