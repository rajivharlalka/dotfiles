
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