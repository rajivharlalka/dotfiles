#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|

# Initialize zoxide
eval "$(zoxide init zsh)"

source ~/dotfiles/home/.zsh/plugin.zsh
source ~/dotfiles/home/.zsh/color-man.zsh
source ~/dotfiles/home/.zsh/key_bindings.zsh
source ~/dotfiles/home/.zsh/alias.zsh
source ~/dotfiles/home/.zsh/functions.zsh

starship_precmd_user_func="Terminal"

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY            # append to history file
setopt HIST_NO_STORE             # Don't store history commands

# #kubectl codecompletion
# if [ $commands[kubectl] ]; then
#   source <(kubectl completion zsh)
# fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || pfetch

export STARSHIP_CONFIG=~/dotfiles/.config/starship/starship.toml

export FLYCTL_INSTALL="/home/vijard/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export DENO_INSTALL="/home/vijard/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

autoload /usr/share/nvm/init-nvm.sh

# Launch Starship
eval "$(starship init zsh)"
