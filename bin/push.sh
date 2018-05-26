#!/bin/bash
for file in ./*
do
    if test -f $file
    then
        echo $file 是文件
    fi
    if test -d $file
    then
        #echo $file 是目录
        cd $file
        git push
        cd ..
    fi
done

