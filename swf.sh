#!/bin/bash

rootDir=/home/hsong/folder/util/mactools/swf

filePath=`pwd`'/'$1

echo $filePath

#sed -i 's/EMBED src=".*.swf"/EMBED src="'$filePath'"/g' $rootDir/swf.html

#google-chrome $rootDir/swf.html

