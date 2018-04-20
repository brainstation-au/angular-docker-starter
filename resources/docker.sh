#!/bin/bash

cp $STARTER_DIRECTORY/resources/Dockerfile ./
cp $STARTER_DIRECTORY/resources/docker-compose.yml ./

sed -i '' "s/__PROJECT_NAME__/${PROJECT_NAME}/g" Dockerfile
sed -i '' "s/__PROJECT_NAME__/${PROJECT_NAME}/g" docker-compose.yml

sed -i '' "s/__ANGULAR_PORT__/${ANGULAR_PORT}/g" Dockerfile
sed -i '' "s/__ANGULAR_PORT__/${ANGULAR_PORT}/g" docker-compose.yml

sed -i '' "s/__KARMA_PORT__/${KARMA_PORT}/g" Dockerfile
sed -i '' "s/__KARMA_PORT__/${KARMA_PORT}/g" docker-compose.yml

sed -i '' "s/__COMPANY__/${COMPANY}/g" Dockerfile
sed -i '' "s/__COMPANY__/${COMPANY}/g" docker-compose.yml

touch ./.dockerignore
echo "*" >> ./.dockerignore

FILE="./package.json"

PACKAGE=$(cat $FILE | jq '.')

SCRIPTS=$(jq '.scripts' <<<$PACKAGE)

NEW_SCRIPTS=$(jq ". + { \"serve\": \"ng serve --host 0.0.0.0 --public-host ${LOCAL_HOST}:${ANGULAR_PORT}\" }" <<<$SCRIPTS)

NEW_PACKAGE=$(jq ".scripts = ${NEW_SCRIPTS}" <<<$PACKAGE)

NEW_PACKAGE2=$(jq ". + {\"engines\":{\"node\":\"8.x\",\"npm\":\"5.x\",\"yarn\":\"1.x\"}}" <<<$NEW_PACKAGE)

jq '.' <<<$NEW_PACKAGE2 > $FILE
