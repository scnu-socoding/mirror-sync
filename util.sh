#!/bin/bash

rep(){
    i=1
    while read line; do
        if((i==${1}));then
            echo "text:'stat: ${2}',"
        elif((i==${1}+1 && ${2}==0));then
            echo "color:'mdl-chip mdl-color--green'"
        elif((i==${1}+1));then
            echo "color:'mdl-chip mdl-color--red'"
        else
            echo "$line"
        fi
        ((i++))
    done < /mnt/socoding/files/fancyindex/js/index.js > /mnt/socoding/files/fancyindex/js/index.js.new
    mv /mnt/socoding/files/fancyindex/js/index.js.new /mnt/socoding/files/fancyindex/js/index.js
}