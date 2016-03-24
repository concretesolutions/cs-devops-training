#!/bin/bash
#####################################################################
# Program: deploy.sh
# Description: Deploy DevOps Training Documentation 
#
# Author: Pedro Cesar Azevedo <pedro.azevedo@concretesolutions.com.br>
#####################################################################

## Define the working directory and a timestamp
WORK_DIR="_book/"
TIMESTAMP="$(date +'%Y%m%d_%H-%M-%S')"
REVISION=$(git rev-parse --short HEAD)

cd $WORK_DIR

git init
git config user.name "Travis CI"
git config user.email "pedro.azevedo@concretesolutions.com.br"

git remote add upstream "https://${GH_TOKEN}@${GH_REF}" 
git fetch upstream
git reset upstream/gh-pages

echo "www.concretesolutions.com.br" > CNAME

touch .

git add -A .
git commit -m "Documentation updated at ${TIMESTAMP} - ${REVISION}"
git push -q upstream HEAD:gh-pages

