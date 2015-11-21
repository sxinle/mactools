#!/bin/bash

workdir=~/workspace

cd $workdir


function checkGitStatus(){
    echo '==========[ '$1' ]=========='
    cd $1
    git status && git pull
    echo $dir' syn over...'
    cd ..
}


DIRS=`find * -maxdepth 0 -type d`

for dir in $DIRS
do
    checkGitStatus $dir
done

cd ~
