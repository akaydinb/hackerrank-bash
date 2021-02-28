#!/bin/bash

readarray MyArray

echo ${MyArray[@]:3:5}
