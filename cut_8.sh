#!/bin/bash

while true ; do
    read STRING
    if [[ x$STRING == "x" ]]; then 
        break;
    fi
    echo $STRING | cut -d' ' -f 1-3
done
