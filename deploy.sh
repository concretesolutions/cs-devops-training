#!/bin/bash

rev=$(git rev-parse --short HEAD)

cd stage/_book

git init
git config user.name "Travis CI"
git config user.email "pedro.azevedo@concretesolutions.com.br"

git remote add upstream "https://${GH_TOKEN}@${GH_REF}" 
git fetch upstream
git reset upstream/gh-pages

echo "www.concretesolutions.com.br/cs-devops-training" > CNAME

touch .

git add -A .
git commit -m "Documentation updated at ${rev}"
git push -q upstream HEAD:gh-pages

