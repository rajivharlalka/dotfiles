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

#kubectl codecompletion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || pfetch

export STARSHIP_CONFIG=~/dotfiles/.config/starship/starship.toml

export FLYCTL_INSTALL="/home/vijard/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

source /usr/share/nvm/init-nvm.sh

# Launch Starship
eval "$(starship init zsh)"
