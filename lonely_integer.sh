#!/bin/bash

read N
readarray MyArray
echo ${MyArray[@]} | sed -e 's/ /\n/g' | sort | uniq --unique
