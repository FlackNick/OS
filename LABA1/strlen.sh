#! /usr/bin/env bash
function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function check_correctness(){
    if [[ -n $3 || -z $2 ]]
    then ERROR_of_amount_arguments
    fi
}

function DO(){
    var="$2"
    size=${#var}
    echo String size is "$size"
}

echo ----------strlen----------
check_correctness $@
DO $@