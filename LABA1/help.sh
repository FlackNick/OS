function ERROR_of_amount_arguments(){
    echo -e '    \033[1;5;31m      {{ERROR}}\033[0m' '    \033[1;31mIncorrect amount of arguments\033[0m' '    \033[1;5;31m{{ERROR}}\033[0m'
    echo -en "\007"
    exit -1
}

function check_correctness(){
    if [[ -n $2 ]]
    then ERROR_of_amount_arguments
    fi
}

function DO(){
  echo -e "\033[1;4;36mParametrs:\033[0m"
  echo -e "\033[1;32mcalc\033[0m \033[3m- Calculator. Print sum/sub/mul/div that means operation and two integers"
  echo -e "\033[1;32msearch\033[0m \033[3m- Searching in directory. Print directory and sample"
  echo -e "\033[1;32mreverse\033[0m \033[3m- Reverse printing data of the file in other file. Print names of this files"
  echo -e "\033[1;32mstrlen\033[0m \033[3m- Amount of the chars in string"
  echo -e "\033[1;32mlog\033[0m \033[3m- Printing logs from: /var/log/anaconda/X.log"
  echo -e "\033[1;32mexit\033[0m \033[3m- Exit with your code. You can write it but standart is '0'"
  echo -e "\033[1;32mhelp\033[0m \033[3m- Help"
  echo -e "\033[1;32minteractive\033[0m \033[3m- Interactive mode"
  echo -e "\033[1;31mКод ошибки -1\033[0m \033[3m- Incorrect amount of arguments"
  echo -e "\033[1;31mКод ошибки -2\033[0m \033[3m- Incorrect request"
  echo -e "\033[1;31mКод ошибки -3\033[0m \033[3m- Incorrect type of arguments"
  echo -e "\033[1;31mКод ошибки -4\033[0m \033[3m- Some math error"
  echo -e "\033[1;31mКод ошибки -5\033[0m \033[3m- Right error"
}
 
check_correctness $@
DO
