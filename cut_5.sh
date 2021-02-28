#!/bin/bash

while IFS=$'\t' read -r -a MyArray ; do
    #read STRING
    if [[ x${MyArray[0]} == "x" ]]; then 
        break;
    fi
    echo ${MyArray[0]} ${MyArray[1]} ${MyArray[2]}
done
