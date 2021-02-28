#!/bin/bash

readarray MyArray

I=0
while [[ "x${MyArray[$I]}" != "x" ]]; do
     echo ${MyArray[$I]} | grep -v [aA]
#    #echo -ne ${MyArray[$I]}
     I=$(($I+1))
done
