# # Colorize older terminal apps (like man)
# # Start blinking
# export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) #q green
# # Start bold
# export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# # Start stand out
# export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# # End standout
# export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# # Start underline
# export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# # End bold, blinking, standout, underline
# export LESS_TERMCAP_me=$(tput sgr0)