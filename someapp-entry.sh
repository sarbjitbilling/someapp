#!/bin/bash

echo "----- shell: arguments passed are $@"
echo "----- shell: env" && env | sort
echo "----- shell: working directory is `pwd`"
echo "----- shell: local directory, ls" && ls -ltra
echo "----- shell: local space, du" && du . -h --max-depth=1
echo "----- shell: whoami is `whoami`"
echo "----- shell: user id is `id -u`"
echo "----- shell: group id is `id -g`"
echo "----- shell: creating a file" && touch shell-file-`date +"%y%m%d_%H%M%S"` && ls -ltra
echo "----- shell: creating a directory" && mkdir shell-dir-`date +"%y%m%d_%H%M%S"` && ls -ltra
echo "----- shell: npm: node modules" && npm list --depth=0

npm run-script sb-sonar-scanner -X -Dsonar.branch.name=main
