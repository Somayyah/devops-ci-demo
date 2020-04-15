#!/bin/bash
export AZURE_VARIABLE=$1
export GIT_REPO=$2
export GIT_BRANCH=$3
export SERVER_NAME=$4
export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
sed -i "s/{/\${/g" web/index.html
echo "$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME"
envsubst '$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html < web/index.html 
echo
cat web/newIndex.html
echo 
cat web/index.html
