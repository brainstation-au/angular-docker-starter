#!/bin/bash

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
\"test:once\": \"ng test --watch=false\",
\"serve\": \"ng serve --host 0.0.0.0 --public-host ${LOCAL_HOST}:${ANGULAR_PORT}\",
\"build:prod\": \"ng build --prod\"
}" <<<$SCRIPTS)

NEW_PACKAGE=$(jq ".scripts = ${NEW_SCRIPTS}" <<<$PACKAGE)

NEW_PACKAGE2=$(jq ". + {\"engines\":{\"node\":\"10.13\",\"npm\":\"6.4.0\"}}" <<<$NEW_PACKAGE)

jq '.' <<<$NEW_PACKAGE2 > $FILE
