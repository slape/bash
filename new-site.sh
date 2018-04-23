#!/bin/bash

#Initializes directory structure for a basic website.
#to use it: sh new-site.sh <name of website>

#todo: use the github api to automatically create a new repo with the same name, attach it as a remote origin, and send an initial readme push.

mkdir $1
cd $1
git init
touch index.html
mkdir css
touch css/master.css
mkdir resources
cd resources
mkdir photos
mkdir videos
