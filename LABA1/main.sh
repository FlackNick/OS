#! /usr/bin/env bash
function File_not_found_ERROR(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mThis file does not exist\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}
function Acces_ERROR(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mAccess denied\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -2
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

checkFile $1
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
    strlen)
        ./strlen.sh $@
        ;;
esac
echo "main works"