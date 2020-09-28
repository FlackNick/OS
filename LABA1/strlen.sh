#! /usr/bin/env bash

function check_correctness(){
    if [ "$1" = "" ]
    then 
    echo String size is 0
    exit 0
    fi
}

function DO(){
    echo "String: '$1'"
    var="$1"
    size=${#var}
    echo String size is "$size"
}

echo ----------strlen----------
check_correctness "$1"
DO "$1"