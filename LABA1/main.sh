#! /usr/bin/env bash
function File_not_found_ERROR(){
    echo "This file does not exist!" 
    exit -1
}
function Acces_ERROR(){
    echo "Acces denied!"
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

case $1 in
    calc)      
        checkFile $1
        ./calc.sh $@
        ;;
    search)
        checkFile $1
        ./search.sh $@
        ;;
esac
echo "main works"