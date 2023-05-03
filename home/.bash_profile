#
# ~/.bash_profile
#
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"
[[ -f ~/.bashrc ]] && . ~/.bashrc