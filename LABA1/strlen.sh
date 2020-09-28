#! /usr/bin/env bash
function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function check_correctness(){
    if [[ -n $2 ]]
    then ERROR_of_amount_arguments
    fi
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
echo $1 
echo $2
check_correctness "$1" "$2"
DO "$1"