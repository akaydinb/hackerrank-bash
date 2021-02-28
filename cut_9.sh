#!/bin/bash

while read l; do
    echo "$l" | cut -f2-
done

