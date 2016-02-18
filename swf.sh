#!/bin/bash

rootDir=/home/hsong/folder/util/mactools/swf

filePath=`pwd`'/'$1

sed -i 's#EMBED src=".*"#EMBED src="'$filePath'"#g' $rootDir/swf.html

google-chrome $rootDir/swf.html
