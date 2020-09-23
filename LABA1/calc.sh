#! /usr/bin/env bash
function ERROR_of_first(){
    exit -1
}

function sum(){
 echo $(( $1 + $2 ))
}

function sub(){
 echo $(( $1 - $2 ))
}

function mul(){
 echo $(( $1 * $2 ))
}

function div(){
 echo $(( $1 / $2 ))
}

function DO(){
    case $1 in
sum)
    sum $2 $3
    ;;
sub)
    sub $2 $3
    ;;
mul)   
    mul $2 $3
    ;;
div)
    div $2 $3
    ;;
*)
    echo "Incorrect data"
    ERROR_of_first
    ;;
esac
}

if []