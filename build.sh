#!/bin/bash
export JOB_STATUS=$6
if [[ "$JOB_STATUS" = "Succeeded" ]];then
  export AZURE_VARIABLE=$1
  export GIT_REPO=$2
  export GIT_BRANCH=$3
  export SERVER_NAME=$4
  export ID=$5
  export AGENT_NAME=$7
  export AGENT_OS=$8
  export AGENT_OSARCH=$9
  export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
  sed -i "s/{/\${/g" web/index.html
  envsubst '$AGENT_OS $AGENT_OSARCH $AGENT_NAME $JOB_STATUS $ID $TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html <  web/index.html
  cp web/newIndex.html web/index.html
  exit 0
else
  cp web/failedTBuild.html web/index.html
  echo "build $JOB_STATUS, try again."
  exit 1
fi
