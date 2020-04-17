#!/bin/bash

echo "Hello, my name is: $MY_NAME"
if [[ "$JOB_STATUS" = "Succeeded" ]];then
  export TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
  sed -i "s/{/\${/g" web/index.html
  envsubst '$AGENT_OS $AGENT_OSARCH $AGENT_NAME $JOB_STATUS $ID $TIMESTAMP $GIT_REPO $GIT_BRANCH $AZURE_VARIABLE $USER $PWD $SERVER_NAME' > web/newIndex.html <  web/index.html
  cp web/newIndex.html web/index.html
  mkdir "/var/www/html/releases/$BUILD_DIR"
  cp web/index.html $BUILD_DIR
  echo "build $JOB_STATUS, Done."
  exit 0
else
  cp web/failedToBuild.html web/index.html
  echo "build $JOB_STATUS, try again."
  exit 1
fi
