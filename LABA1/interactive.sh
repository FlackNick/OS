#! /usr/bin/env bash
check_var
#переменная для функции проверки ошибок
function ERROR_of_request(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect request!\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function Acces_ERROR(){
    echo -e '\033[1;31mAccess denied\033[0m' "($1)"
}

function File_not_found_ERROR(){
    echo -e '\033[1;31mFile does not exist\033[0m' "($1)"
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
    checkFile revers.sh 
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
    echo -e '\033[1mC:\033[0m Reverse one file (revers)'
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
        req='revers'
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
        req='exit'
        break
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
    Arguments_request
    read arg1 
    ./main.sh $req "$arg1" 
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
    if [ $req = 'exit' ]
    then break
    fi

    echo -e '\033[1;5mPlease, enter...\033[0m'
    read
    done 
}
#главная функция работы
echo ----------interactive----------
checkALLFiles
DO
