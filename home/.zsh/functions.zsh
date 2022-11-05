
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
