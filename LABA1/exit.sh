#! /usr/bin/env bash
function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function ERROR_value(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mValue should be from -256 to 256\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function check_correctness(){
    if [[ -n $3 ]]
    then ERROR_of_amount_arguments
    fi
    if [[ -n $2 ]]
    then 
        re='^-?[0-9]+$'
        if ! [[ "$2" =~ $re || "$2" =~ $re && "$2" -gt 256 || "$2" =~ $re && "$2" -lt -256 ]]
        then ERROR_value
        fi
    fi
}

function DO(){
    if [[ -n $2 ]]
    then 
        exit $2
    else
        exit 0
    fi
}

echo ----------exit----------
check_correctness $@
DO $@