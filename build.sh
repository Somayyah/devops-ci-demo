#!/bin/bash
export AZURE_VARIABLE=$1
export GIT_REPO=$2
export GIT_BRANCH=$3
export SERVER_NAME=$4
export ID=$5
export job_status=$6
export agent_name=$7
export Agent_OS=$8
export Agent_OSArchitecture=$9
export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
sed -i "s/{/\${/g" web/index.html
envsubst '$Agent_OS $Agent_OSArchitecture $agent_name $job_status $ID $TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html <  web/index.html
cp web/newIndex.html web/index.html
echo
echo "$Agent_OS $Agent_OSArchitecture $agent_name $job_status $ID $TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME"
echo
cat web/newIndex.html
echo
cat web/index.html
