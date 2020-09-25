#! /usr/bin/env bash

function ERROR_of_request(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect request!\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function checkFile(){
    if ! [ -a $1.sh ] 
    then
    File_not_found_ERROR
    fi
    if ! [ -r $1.sh ]
    then 
    Acces_ERROR
    fi
}

function Head_request(){
    echo '  _-_-_-_-_-_-_-_-_-_-_-_'
    echo '- What do you want to do? -'
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
    echo Pleace, write your arguments
}

function DO(){
    for ((;;))
    do
    clear
    Head_request
    read answer
        case $answer in
    A)      
        req='calc'
        ;;
    B)
        req='search'
        ;;
    C)
        req='revers'
        ;;
    D)
        req='strlen'
        ;;
    E)
        req='log'
        ;;
    G)
        req='exit'
        ;;
    F)
        req='help'
        ;;
    *)
        ERROR_of_request
        ;;
    esac
    clear
    if ! [ $answer = 'F' ]
    then 
    Arguments_request
    read arg1 arg2 arg3
    fi
    clear
    ./main.sh $req $arg1 $arg2 $arg3
    if [ $req = 'exit' ]
    then break
    fi
    echo pleace, enter...
    read
    done 
}

echo ----------interactive----------
DO $@