rc() {
    #!/bin/bash
    PROG_NAME=$1
    g++ -Werror $PROG_NAME
    if [[ $? == 0 ]]; then
     ./a.out
    fi  
}

# Reload this file in the shell, useful after making changes
alias reload='source ~/.bash_profile'

# Make dir and cd into it with 'take' or just 'tk'
function take() { mkdir -p $1; cd $1; }
alias tk='take'