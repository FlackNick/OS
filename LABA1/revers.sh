#! /usr/bin/env bash
function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function ERROR_of_rights(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mFirst file is not available for you \033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function ERROR_not_exist(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mFirst file does not exist \033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function ERROR_dir_access(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mDirectory of second file is not available for you\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -3
}

function ERROR_creating_access(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mError of directory of second file for creating\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -4
}

function ERROR_access(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mYou do not have enought rights for second directory\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -5
}

function check_correctness(){
    if [[ -n $4 || -z $3 || -z $2 ]]
    then ERROR_of_amount_arguments
    fi
    if ! [[ -e $2 ]]
    then ERROR_not_exist
    fi 
    if ! [[ -r $2 ]]
    then ERROR_of_rights
    fi
    if ! [[ -r "$(dirname $3)" ]]
    then ERROR_dir_access
    fi
    if ! [[ -w "$(dirname $3)" ]] && ! [[ -f "$3" ]]
    then ERROR_creating_access
    fi
    if [[ -f $3 ]] && ! [[ -w $3 ]]
    then ERROR_dir_access
    fi
}

function DO(){
        tac $1 >> buffer.txt
        echo >> $2
        rev buffer.txt >> $2
        rm buffer.txt
        echo success!
        break
done
}

echo ----------revers----------
check_correctness $@
DO $@

