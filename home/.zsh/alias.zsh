#### Alisas

alias ls='exa --long --header --icons --sort=type'
alias tree='exa --tree --level 3'
alias sdn="sudo shutdown -h now" # Quick shutdown
alias cp="cp -i" # Confirm before overwriting something
alias pkg="yay -Q | fzf"
alias server="python -m http.server 7777"
alias ssh='env TERM=xterm-256color ssh' # allows kitty to work with ssh
alias start-bluetooth="sudo systemctl start bluetooth.service"

alias cat="bat"

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias vim=nvim
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


# Reload this file in the shell, useful after making changes
alias reload='source ~/.zshrc'

alias tk='take'

alias dotfiles='code ~/dotfiles'

alias ..='cd ..'
alias ...='cd ../..'

alias typora='typora ~/Documents/randoms/ 2>/dev/null'