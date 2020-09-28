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
}

function DO(){
    ref="/var/log/anaconda/X.log"
    while read line
    do
      if [[ "$line" = *"(WW)"* && "$line" != *"(WW) warning, (EE) error, (NI) not implemented, (??) unknown."* ]]
      then
        echo -e "${line//"(WW)"/"\033[31mWarning:\033[0m"}"
      fi
    done < "$ref"
    while read line
    do
      if [[ "$line" = *"(II)"* && "$line" != *"(++) from command line, (!!) notice, (II) informational,"* ]]
      then
        echo -e "${line//"(II)"/"\033[34mInformation:\033[0m"}"
      fi
    done < "$ref"
}

echo ----------log----------
check_correctness $@
DO $@