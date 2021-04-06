#!/bin/bash

rep(){
    i=1
    j=-5
    while read line; do
        result=$(echo ${line} | grep "${2}")
        if [[ "$result" != "" ]]; then
            j=${i}
            echo "$line"
        elif ((i==${j}+1)); then
            echo "text: 'stat: ${1}',"
        elif ((i==${j}+2 && ${1}==0)); then
            echo "color: 'mdl-chip mdl-color--green'"
        elif ((i==${1}+2)); then
            echo "color: 'mdl-chip mdl-color--red'"
        else
            echo "$line"
        fi
        ((i++))
    done < /mnt/socoding/files/fancyindex/js/index.js > /mnt/socoding/files/fancyindex/js/index.js.new
    mv /mnt/socoding/files/fancyindex/js/index.js.new /mnt/socoding/files/fancyindex/js/index.js
}