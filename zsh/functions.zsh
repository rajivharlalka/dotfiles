
#Run Code -Code runner for C/C++ codes
rc() {
    #!/bin/bash
    PROG_NAME=$1
    g++ -Werror $PROG_NAME
    if [[ $? == 0 ]]; then
     ./a.out
    fi  
}

# Make dir and cd into it with 'take' or just 'tk'
function take() {
     mkdir -p $1; cd $1;
 }

function gen_pass() {
    length=${1:?"length must be specified"}
    length=$((length/2))
    dd if=/dev/random bs=1 count=${length} 2>/dev/null | od -An -tx1 | tr -d ' \t\n' ; echo
}

function matrix() {
    echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4;        letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}' 
}



help() {
    "$@" --help 2>&1 | bathelp
}