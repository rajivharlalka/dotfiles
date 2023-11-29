#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|


source $HOME/plugin.zsh
source $HOME/color-man.zsh
source $HOME/key_bindings.zsh
source $HOME/alias.zsh
source $HOME/functions.zsh

starship_precmd_user_func="Terminal"

# Make History Better
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

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

export STARSHIP_CONFIG=~/dotfiles/.config/starship/starship.toml

. "$HOME/.cargo/env"
export FLYCTL_INSTALL="/home/rajiv/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# gpg needs this
GPG_TTY=$(tty)
export GPG_TTY

autoload /usr/share/nvm/init-nvm.sh

# Initialize zoxide
eval "$(zoxide init zsh)"

# Launch Starship
[ -z "$PS1" ] || pfetch
eval "$(starship init zsh)"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-2.3.6/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

PATH="/home/rajiv/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rajiv/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rajiv/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rajiv/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rajiv/perl5"; export PERL_MM_OPT;
