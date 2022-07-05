#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|

# Launch Starship
eval "$(starship init zsh)"

# Zplug (this is the location that arch installs zpl)
source /usr/share/zsh/scripts/zplug/init.zsh

plugins=(git z zsh-syntax-highlighting zsh-autosuggestions)

source /home/vijard/.zplug/repos/robbyrussell/oh-my-zsh/oh-my-zsh.sh


# Colorize older terminal apps (like man)
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

# aliases
alias ls='exa --long --header --icons --sort=type'
alias tree='exa --tree --level 3'
alias sdn="sudo shutdown -h now" # Quick shutdown
alias cp="cp -i" # Confirm before overwriting something
alias pkg="yay -Q | fzf"
alias yt='youtube-dl --add-metadata -i'
alias cz='git-cz --disable-emoji'
alias sf="python -m http.server 7777"
alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh
alias start-bluetooth="sudo systemctl start bluetooth.service"
alias acads="cd ~/Documents/Acads && nautilus -q && nautilus ."
alias type="cd Downloads && ./toipe"

# load the good parts from oh-my-zsh
# zsh auto completion
zplug "lib/completion",      from:oh-my-zsh
# setups up histoyr
zplug "lib/history",         from:oh-my-zsh
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"

zplug "djui/alias-tips"

# Make History Better
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="Terminal"

# Alias tips so I don't forget the aliases for commands
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Psst, you can use the alias: "
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES="_ ll vi ls"

# Install plugins if there are plugins that have not been installed (copied from the zplug readme)
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
        if read -q; then
        echo; zplug install
    fi
fi

#kubectl codecompletion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# # Then, source plugins and add commands to $PATH
zplug load

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || pfetch
