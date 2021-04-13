#!/bin/bash

. creds

directory=$1
project=$2

mkdir -p  /home/$CPUUSER/programming/$1/$2
cd /home/$CPUUSER/programming/$1/$2

curl -X POST -u $USERNAME:$TOKEN https://api.github.com/user/repos -d "{\"name\":\"$project\"}"
echo "# $project" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:$USERNAME/$project.git
git push -u origin main

code .