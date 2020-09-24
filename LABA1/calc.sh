#! /usr/bin/env bash
function ERROR_of_request(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect request\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -e '\033[1;31m                      you should write 2 arguments after you request\033[0m'     
    echo -en "\007"
    exit -2
}

function ERROR_string_argument(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mFirst or second argument is not an integer\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -3
}

function ERROR_null_div(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mDivision by zero is prohibited\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -4
}

function check_correctness(){
    if [[ -n $5 || -z $4 || -z $3 ]]
    then ERROR_of_amount_arguments
    fi
    re='^-?[0-9]+$'
    if ! [[ "$3" =~ $re && "$4" =~ $re ]]
    then ERROR_string_argument
    fi
    if [[ $4 -eq '0' && $2 = 'div' ]]
    then ERROR_null_div
    fi
}

function sum(){
 echo Task: $1 + $2
 echo Answer: $(( $1 + $2 ))
}

function sub(){
 echo Task: $1 - $2
 echo Answer: $(( $1 - $2 ))
}

function mul(){
 echo Task: $1 '*' $2
 echo Answer: $(( $1 * $2 ))
}

function div(){
 echo Task: $1 / $2
 echo Answer: $(( $1 / $2 ))
}

function DO(){
    case $2 in
sum)
    sum $3 $4
    ;;
sub)
    sub $3 $4
    ;;
mul)   
    mul $3 $4
    ;;
div)
    div $3 $4
    ;;
*)
    ERROR_of_request
    ;;
esac
}

echo ----------calc----------
check_correctness $@
DO $@