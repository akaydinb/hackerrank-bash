#!/bin/bash

readarray MyArray

echo ${MyArray[@]} | sed -e 's/^[A-Z]/\./g' | sed -e 's/ [A-Z]/ \./g'
#I=0
#while read -a MyArray; do
#    echo $MyArray
#    #echo -ne ${MyArray[$I]}
#    I=$(($I+1))
#done
