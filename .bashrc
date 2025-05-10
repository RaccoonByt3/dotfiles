#
# ~/.bashrc
#

BOLD="\[\e[1m\]"
DEEP_ORANGE="\[\e[38;5;166m\]"
BG_GRAY="\[\e[48;5;255m\]"
FG_GRAY="\[\e[38;5;255m\]"
GREEN="\[\e[32m\]"
TRIANGLE=""
RESET="\[\e[0m\]"


if [ -f "$HOME/.shitfiles/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "$HOME/.shitfiles/bash-git-prompt/gitprompt.sh"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="${BG_GRAY}${BOLD}${DEEP_ORANGE}\u${RESET}${FG_GRAY}${TRIANGLE}${RESET}@\h \W]\$ "
. "$HOME/.cargo/env"

source ~/.local/bin/bashmarks.sh
#systemctl --user start elephant.service 
#walker --gapplication-service &
