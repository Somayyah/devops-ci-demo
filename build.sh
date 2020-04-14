#!/bin/bash
export SERVER_NAME=$(hostname)
#export TIMESTAMP=$2
export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
export GIT_REPO="devops-ci-demo"
export GIT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

#export GIT_BRANCH=$(echo ${GIT_BRANCH##*,})
export AZURE_VARIABLE=$AZURE_VARIABLE
sed -i "s/{/\${/g" web/index.html
envsubst '$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html < web/index.html 
