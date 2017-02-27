#!/bin/bash
if [ "$2" = "" ] ;then
    echo "0__初始位置"
    echo "1__广州"
    echo "2__兰州"
    echo "3__沈阳"
    echo "4__大连"
    echo "5__北京"
    echo "6__深圳"
fi

java -cp ~/folder/util/mactools/work/ Mcode2Lon $1 $2 > /tmp/a1
cat /tmp/a1

cmd="curl -i -X POST \
    -H "Content-Type:application/x-www-form-urlencoded" \
    -d \
    '`cat /tmp/a1`' \
    'http://192.168.3.71:8010/search/v2/keyword'"

eval $cmd > /tmp/a1
tail -n 1 /tmp/a1 | jq '.' | xclip -selection c
