function ERROR_of_amount_arguments(){
    echo "Incorrect amount of arguments"
    exit -2
}

function check_correctness(){
    if [[ -n $4 || -z $3 || -z $2 ]]
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

grep -r -s "$3" "$2"