# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom .git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme

#----------------------------------------------------------------------------BASH GIT PROMPT-----------------------------------------------------------------
#if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
#  GIT_PROMPT_THEME=Default
#  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
#fi

#----------------------------------------------------------------------------PROMPT COLORS-----------------------------------------------------------------
COLOR1="\[\033[0;36m\]"
COLOR2="\[\033[1;32m\]"
COLOR3="\[\033[0;36m\]"
COLOR4="\[\033[0;37m\]"
COLOR5="\[\033[1;33m\]"
LSCOLORS="DxGxFxdxCxdxdxhbadExEx"
export LSCOLORS
if [ "$UID" = "0" ];
then
# I am root
COLOR2="\[\033[1;31m\]"
fi

export PS1="\[\033[38;5;2m\]local:\[$(tput sgr0)\]\[\033[38;5;6m\]\W\[$(tput sgr0)\]\[\033[38;5;2m\] \u\\$ \[$(tput sgr0)\]"

#----------------------------------------------------------------------------ENV VARIABLES-----------------------------------------------------------------
export EDITOR=vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PATH=/usr/local/bin:$PATH
export SHELL=/opt/homebrew/bin/bash
export PATH="$PATH:/Users/$USER/.local/bin"

#----------------------------------------------------------------------------BASH ALIASES-----------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ---------------------------------------------------------------------------BASH HISTORY SIZE---------------------------------------------------------------
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# export HISTTIMEFORMAT="[%F %T] "
export HISTTIMEFORMAT="%y/%m/%d %T "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"


#export GOROOT=/Users/$USER/Go/go
PATH=$PATH:$GOROOT/bin

#export AWS_PROFILE=$(cat ~/.awsenv)
export AWS_PROFILE=default
export BASH_SILENCE_DEPRECATION_WARNING=1

source <(kubectl completion bash)
#alias kc='time kubectl --cache-dir=/dev/null'
alias kc='time kubectl'
complete -F __start_kubectl kc

# pet snippets
function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

export HELM_CACHE_HOME=~/.helm/cache
export HELM_CONFIG_HOME=~/.helm/config
export HELM_DATA_HOME=~/.helm/data
export HELM_S3_MODE=3
export S3_ACL=bucket-owner-full-control
export PATH=~/.helm:$PATH
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# usually alias to nvim
alias vim=nvim
alias vi=nvim
alias kubectx="kubectl ctx"
alias diff=colordiff

# ssh alias for connecting to other mac
alias ssh='TERM=xterm-256color ssh'

export PAGER="less -r"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"


# IF HAVING BASH COMPLETION ISSUES:
# https://www.shell-tips.com/mac/upgrade-bash/

