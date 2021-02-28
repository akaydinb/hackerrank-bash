#!/bin/bash

read N
SUM=0

for I in $(seq 1 $N); do 
    read SAYI
    SUM=$(($SUM+$SAYI))
done

echo "scale=3; $SUM / $N" | bc -l

