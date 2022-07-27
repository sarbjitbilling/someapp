#!/bin/bash

CHANGE_ID=$1
echo "----- CHANGE_ID is ${CHANGE_ID}"

CHANGE_BRANCH=$2
echo "----- CHANGE_BRANCH is ${CHANGE_BRANCH}"

CHANGE_TARGET=$3
echo "----- CHANGE_TARGET is ${CHANGE_TARGET}"

echo "----- shell: working directory is `pwd`"
echo "----- shell: local directory, ls" && ls -ltra
echo "----- shell: local space, du" && du . -h --max-depth=1
echo "----- shell: npm: node modules" && npm list --depth=0

npm run-script sb-sonar-scanner \
    -Dsonar.pullrequest.key=${CHANGE_ID} \
    -Dsonar.pullrequest.branch=${CHANGE_BRANCH} \
    -Dsonar.pullrequest.base=${CHANGE_TARGET}
