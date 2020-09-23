#! /usr/bin/env bash
function File_not_found_ERROR(){
    exit -1
}
function Acces_ERROR(){
    exit -2
}

function checkFile(){
    if ! [ -a $1.sh ] 
    then
    echo "This file does not exist!" 
    File_not_found_ERROR
    fi
    if ! [ -r $1.sh ]
    then 
    echo "Acces denied!"
    Acces_ERROR
    fi
}

case $1 in
     calc)      
          checkFile $1
          ./calc.sh $2 $3 $4
          ;;
esac
echo "hfhevw"