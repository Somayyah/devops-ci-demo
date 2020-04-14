#!/bin/bash
export SERVER_NAME=$(hostname)
export TIMESTAMP=$(date +%m-%d-%Y)
export GIT_REPO="devops-ci-demo"
export GIT_BRANCH=$(git symbolic-ref -q HEAD)
export GIT_BRANCH=$(echo ${GIT_BRANCH##*,})
export AZURE_VARIABLE=$1
sed -i "s/{/\${/g" web/index.html
envsubst '$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html < web/index.html 
