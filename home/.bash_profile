#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GPG_TTY=$(tty)

export PATH="$HOME/.poetry/bin:$PATH"
