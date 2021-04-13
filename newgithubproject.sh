#!/bin/bash

. creds

directory=$1
project=$2

mkdir -p  /home/jparadise/programming/$1/$2
cd /home/jparadise/programming/$1/$2

#pipenv run python app.py

curl -H "Authroization: token <$TOKEN>"

curl -X POST -u jp117:$TOKEN https://api.github.com/user/repos -d "{\"name\":\"$project\"}"
echo "# $project" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/jp117/$project.git
git push -u origin main