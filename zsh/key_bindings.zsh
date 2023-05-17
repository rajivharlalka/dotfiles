
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ctrl+left and ctrl+left to move word by word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ctrl+backspace to delete word
bindkey "^H" backward-kill-word

#delete key to delete work backwords
bindkey "^[[3~" delete-char