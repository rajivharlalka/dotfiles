# Zplug (this is the location that arch installs zpl)
source /usr/share/zsh/scripts/zplug/init.zsh

# load the good parts from oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"
# fuzzy find tab completions
zplug "Aloxaf/fzf-tab"
# General ZSH Plugins
zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-history-substring-search", from:github, defer:2

zplug "djui/alias-tips", from:github

# Install plugins if there are plugins that have not been installed (copied from the zplug readme)
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
        if read -q; then
        echo; zplug install
    fi
fi

# # Then, source plugins and add commands to $PATH
zplug load