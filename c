#!/bin/bash
# require gem install iStats
function sensorMonitor() {
istats

echo -e "\n--- Top 5 Process ---"

ps xro %cpu=,comm= | while read cpu comm; ((i++<5)); do 

int=$cpu
int="${int%%.*}"
if   (($int >= 50)); then color=$'\e[31m';
elif (($int >= 25)); then color=$'\e[33m';
else                      color=$'\e[32m';
fi;

echo "$color$cpu% $(basename "$comm")"$'\e[0m'"";
done
echo -e "-------------------------------------------"
}



if [ $# != 0  ] ; then
    for((j=1;j<10;j++))
    do
        sensorMonitor
        SLEEP 1
    done
else
    sensorMonitor
fi 



df -Hl | {
read keys;
keys="${keys%% on}";
while read ${keys//%}; do
    echo "`basename "$Mounted"` - $Used/$Size ($Capacity)";
done
}

