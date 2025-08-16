
# # Zplug init
# source /usr/share/zsh/scripts/zplug/init.zsh

# # Plugins
# zplug "zsh-users/zsh-autosuggestions", defer:1
# zplug "zdharma-continuum/fast-syntax-highlighting", defer:1
# zplug "Aloxaf/fzf-tab", defer:2
# zplug "zsh-users/zsh-completions", defer:2
# zplug "zsh-users/zsh-history-substring-search", defer:2
# zplug "plugins/git", from:oh-my-zsh
# # Optional: only if you really want it
# zplug "djui/alias-tips", from:github, defer:3

# # Plugin install check
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# # Load plugins
# zplug load

# Install zinit if not already installed
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}Zinit%F{220}...%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# Load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load essential plugins with turbo mode (async loading)
# Syntax highlighting and autosuggestions
zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions

# Completions (load in background)
zinit wait"0" lucid for \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# fzf-tab completion enhancer
zinit wait lucid for \
    Aloxaf/fzf-tab

# History substring search (load after syntax highlighting)
zinit wait lucid for \
    zsh-users/zsh-history-substring-search

# Git plugin from Oh-My-Zsh
zinit wait"1" lucid for \
    OMZP::git

# Alias tips (loaded last as it's least critical)
zinit wait"2" lucid for \
    djui/alias-tips

# Configure history substring search keys
zinit wait lucid atload"bindkey '^[[A' history-substring-search-up; bindkey '^[[B' history-substring-search-down" for \
    zsh-users/zsh-history-substring-search

# Initialize completions properly once
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi