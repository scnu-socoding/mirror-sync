#!/bin/bash

rep(){
    i=1
    j=-5
    rm -f /mnt/socoding/files/fancyindex/js/index.js.new
    while read line; do
        result=$(echo ${line} | grep "${1}")
        if [[ "$result" != "" ]]; then
            j=${i}
            echo "$line" >> /mnt/socoding/files/fancyindex/js/index.js.new
        elif ((i==${j}+1)); then
            echo "text: 'stat: ${2}'," >> /mnt/socoding/files/fancyindex/js/index.js.new
        elif ((i==${j}+2 && ${2}==0)); then
            echo "color: 'mdl-chip mdl-color--green'" >> /mnt/socoding/files/fancyindex/js/index.js.new
        elif ((i==${j}+2)); then
            echo "color: 'mdl-chip mdl-color--red'" >> /mnt/socoding/files/fancyindex/js/index.js.new
        else
            echo "$line" >> /mnt/socoding/files/fancyindex/js/index.js.new
        fi
        ((i++))
    done < /mnt/socoding/files/fancyindex/js/index.js
    mv /mnt/socoding/files/fancyindex/js/index.js.new /mnt/socoding/files/fancyindex/js/index.js
}