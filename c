#!/bin/bash
# first gem install iStats
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

df -Hl | {
  read keys;
  keys="${keys%% on}";
  while read ${keys//%}; do
    echo "`basename "$Mounted"` - $Used/$Size ($Capacity)";
  done
}


