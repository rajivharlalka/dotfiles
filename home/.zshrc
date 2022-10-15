#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|

# Initialize zoxide
eval "$(zoxide init zsh)"

# Zplug (this is the location that arch installs zpl)
source /usr/share/zsh/scripts/zplug/init.zsh

# Colorize older terminal apps (like man)
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) #q green
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

# load the good parts from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"

# zsh auto completion
zplug "lib/completion",      from:oh-my-zsh
# setups up histoyr
zplug "lib/history",         from:oh-my-zsh    
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-history-substring-search"
# fuzzy find tab completions
zplug "Aloxaf/fzf-tab"

# General ZSH Plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-history-substring-search", from:github, defer:2
zplug "djui/alias-tips", from:github

# SSH
zplug "hkupty/ssh-agent", from:github

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


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ctrl+left and ctrl+left to move word by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ctrl+backspace to delete word
bindkey "^H" backward-kill-word

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

bindkey '       ' autosuggest-accept

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### Alisas

alias ls='exa --long --header --icons --sort=type'
alias tree='exa --tree --level 3'
alias sdn="sudo shutdown -h now" # Quick shutdown
alias cp="cp -i" # Confirm before overwriting something
alias pkg="yay -Q | fzf"
alias sf="python -m http.server 7777"
alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh
alias start-bluetooth="sudo systemctl start bluetooth.service"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vi=nvim
alias svi='sudo vi'
alias vis='nvim "+set si"'
alias edit='nvim'
alias vim='nvim'

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

# # Then, source plugins and add commands to $PATH
zplug load

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || pfetch

export STARSHIP_CONFIG=~/dotfiles/.config/starship/starship.toml

# Launch Starship
eval "$(starship init zsh)"