function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function ERROR_of_rights(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mThis directory is not available for you \033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function ERROR_not_exist(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mThis directory do not exist\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -3
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
}

echo ----------search----------
check_correctness $@
grep -r -s "$3" "$2"