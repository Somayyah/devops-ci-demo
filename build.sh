#!/bin/bash
export AZURE_VARIABLE=$1
export GIT_REPO=$2
export GIT_BRANCH=$3
export SERVER_NAME=$4
#export TIMESTAMP=$2
export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
#export GIT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
#export GIT_BRANCH=$(echo ${GIT_BRANCH##*,})
sed -i "s/{/\${/g" web/index.html
envsubst '$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html < web/index.html 
