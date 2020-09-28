#! /usr/bin/env bash
function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function File_not_found_ERROR(){
    echo "                          File: $1.sh"
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mThis file does not exist\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
}

function Access_ERROR(){
    echo "                          File: $1.sh"
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mAccess denied\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -3
}

function Nude_main(){
    if [[ $1 = '' ]]
    then 
    echo -e '\033[1;31mYou enter empty argument, please, enter "help" after to know all opportunities\033[0m'
    exit -4
    fi
}
#ошибки
function checkFile(){
    if ! [ -a $1.sh ] 
    then
    File_not_found_ERROR $1
    fi
    if ! [ -r $1.sh ]
    then 
    Acces_ERROR
    fi
}
#проверка на ошибки
function DO(){
    case $1 in
    calc)      
        ./calc.sh $@
        ;;
    search)
        ./search.sh $@
        ;;
    revers)
        ./revers.sh $@
        ;;
    log)
        ./log.sh $@
        ;;
    exit)
        ./exit.sh $@
        ;;
    help)
        ./help.sh $@
        ;;
    interactive)
        ./interactive.sh $@
        ;;
    esac
}
#запуск остальных файлов из мейна
Nude_main $1
checkFile $1
if [ $1 = "strlen" ]
then 
    if ! [[ $# -eq 2 ]]
    then 
    ERROR_of_amount_arguments
    fi
./strlen.sh "$2"
fi
DO $@