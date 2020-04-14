#!/bin/bash

echo "Running the build script..."
<<<<<<< HEAD
echo "AZURE_VARIABLE=$1"
HOSTNAME=$(hostname)
echo "I am ${HOSTNAME}."
echo "The time is $(date +%m-%d-%Y)."
echo "The logged in user is: ${USER}."
echo "Current working directory: ${PWD}."
=======

export SERVER_NAME=$(hostname)
export STIMESTAMP=$(date +%m-%d-%Y)
export SGIT_REPO="devops-ci-demo"
export SGIT_BRANCH=$(git symbolic-ref -q HEAD)
export SGIT_BRANCH=$(echo ${GIT_BRANCH##*/})
export SAZURE_VARIABLE=$1
sed -i "s/{/\${/g" web/index.html
envsubst '$TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME $TIMESTAMP' > web/newIndex.html < web/index.html 
>>>>>>> test_branch
