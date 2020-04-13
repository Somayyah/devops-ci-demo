#!/bin/bash

echo "Running the build script..."

SERVER_NAME=$(hostname)
TIMESTAMP=$(date +%m-%d-%Y)
GIT_REPO="devops-ci-demo"
GIT_BRANCH=$(git symbolic-ref -q HEAD)
GIT_BRANCH=$(echo ${GIT_BRANCH##*/})
AZURE_VARIABLE=$1
sed -i 's/{/\${/g' 'web/index.html'
