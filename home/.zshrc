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

# Disable % eof
unsetopt prompt_cr prompt_sp


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
alias notes="cd ~/Documents/projects/doc && code dendron.code-workspace"

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


export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin


# # Then, source plugins and add commands to $PATH
zplug load

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || pfetch



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export FLYCTL_INSTALL="/home/vijard/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### Alisas

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'

alias ports='netstat -tulanp'

alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'