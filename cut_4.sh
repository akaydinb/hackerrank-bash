#!/bin/bash

while true ; do
    read STRING
    if [[ x$STRING == "x" ]]; then 
        break;
    fi
    echo $STRING | cut -b 1-4
done
