#!/bin/bash

echo "Running the build script..."

HOSTNAME=$(hostname)
echo "I am ${HOSTNAME}."
echo "The time is $(date +%m-%d-%Y)."
echo "The logged in user is: ${USER}."
echo "Current working directory: ${PWD}."
