#! /usr/bin/env bash
check_var
#переменная для функции проверки ошибок
function check_sym(){
    word="$1";
    size=${#word}
    s=$(( $size - 1 ))
    if ! [[ ${word:0:1} = '"' && ${word:$s:$size} = '"' ]]
    then 
    echo -e '\033[1;31mIncorrect string! Please, write string in ""\033[0m'
    exit -5
    fi
}

function ERROR_of_request(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect request!\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function ERROR_value(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mValue should be from -256 to 256\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function Acces_ERROR(){
    echo -e '\033[1;31mAccess denied\033[0m' "($1)"
    exit -3
}

function File_not_found_ERROR(){
    echo -e '\033[1;31mFile does not exist\033[0m' "($1)"
    exit -4
}

function Enter_string(){
    echo 'Enter your string in ""'
}
#ошибки
function checkFile(){
    if ! [ -e $1 ] 
    then
    File_not_found_ERROR $1
    check_var=1
    fi
    if ! [ -r $1 ]
    then 
    Acces_ERROR $1
    check_var=1
    fi
}

function checkALLFiles(){
    clear
    checkFile calc.sh
    checkFile search.sh 
    checkFile reverse.sh 
    checkFile strlen.sh 
    checkFile log.sh 
    checkFile help.sh 
    checkFile exit.sh  
    if [[ check_var -eq 1 ]]
    then 
    echo -e '\033[1;5mPlease, enter...\033[0m'
    read
    fi
}
#проверки файлов на ошибки
function Head_request(){
    echo '  _-_-_-_-_-_-_-_-_-_-_-_'
    echo -e '\033[1;34m- What do you want to do? -\033[0m'
    echo '  -_-_-_-_-_-_-_-_-_-_-_-'
    echo 
    echo -e '\033[1mA:\033[0m Use calculator (calc)'
    echo -e '\033[1mB:\033[0m Find word (search)'
    echo -e '\033[1mC:\033[0m Reverse one file (reverse)'
    echo -e '\033[1mD:\033[0m Know how long the string (strlen)'
    echo -e '\033[1mE:\033[0m Read /var/log/anaconda/X.log (log)'
    echo -e '\033[1mF:\033[0m HELP ME!!!'
    echo -e '\033[1mG:\033[0m Exit'
    echo -e '\033[1;5mWrite A,B,C...\033[0m'
}

function Arguments_request(){
    echo Please, write your arguments
}
#диалоговые функции
function DO(){
    for ((;;))
    do
    clear
    Head_request

    for ((;;))
    do
    read answer
        case $answer in
    A)      
        req='calc'
        break
        ;;
    B)
        req='search'
        break
        ;;
    C)
        req='reverse'
        break
        ;;
    D)
        req='strlen'
        break
        ;;
    E)
        req='log'
        break
        ;;
    G)
        clear
        echo "Enter your code: "
        read codeeeee
        re='^-?[0-9]+$'
        if ! [[ "$codeeeee" =~ $re || "$codeeeee" =~ $re && "$codeeeee" -gt 256 || "$codeeeee" =~ $re && "$codeeeee" -lt -256 ]]
        then ERROR_value
        fi
        if [ -z $codeeeee ]
        then 
        exit 0
        fi
        exit $codeeeee
        ;;
    F)
        req='help'
        break
        ;;
    *)
        echo -e '\033[1;31mIncorrect request! Please, write A,B,C...\033[0m'
        echo -en "\007"
        ;;
    esac
    done

    clear
    if [[ $answer = 'D' ]]
    then
    Enter_string
    read arg1 
    check_sym "$arg1"
    clear
    ./main.sh $req "$arg1" "int"
    echo -e '\033[1;5mPlease, enter...\033[0m'
    read
    continue
    fi

    if ! [[ $answer = 'F' || $answer = 'E' ]]
    then 
    Arguments_request
    read arg1 arg2 arg3
    fi

    clear
    ./main.sh $req $arg1 $arg2 $arg3

    echo -e '\033[1;5mPlease, enter...\033[0m'
    read
    done 
}
#главная функция работы
echo ----------interactive----------
checkALLFiles
DO
