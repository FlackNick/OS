#! /usr/bin/env bash
function ERROR_of_request(){
    echo "Incorrect request"
    exit -1
}

function ERROR_of_amount_arguments(){
    echo "Incorrect amount of arguments"
    exit -2
}

function ERROR_string_argument(){
    echo "First or second argument is not an integer"
    exit -3
}

function ERROR_null_div(){
    echo "Division by zero is prohibited"
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
check_correctness $@
DO $@