# Add homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Make ls listings prettier
alias ls="ls -GF"
source ~/.bashrc

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# http://superuser.com/questions/403650/programmatically-set-the-color-of-a-tab-in-iterm2
# https://iterm2.com/documentation-escape-codes.html
function color {
    case $1 in
    green)
    echo -e "\033]6;1;bg;red;brightness;57\a"
    echo -e "\033]6;1;bg;green;brightness;197\a"
    echo -e "\033]6;1;bg;blue;brightness;77\a"
    ;;
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"
    echo -e "\033]6;1;bg;green;brightness;60\a"
    echo -e "\033]6;1;bg;blue;brightness;83\a"
    ;;
    orange)
    echo -e "\033]6;1;bg;red;brightness;227\a"
    echo -e "\033]6;1;bg;green;brightness;143\a"
    echo -e "\033]6;1;bg;blue;brightness;10\a"
    ;;
    esac
 }

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
#fi

export PATH="/usr/local/opt/ruby/bin:$PATH"
export LANG="en_US.UTF-8"

# Created by `pipx` on 2023-01-18 19:13:17
export PATH="$PATH:/Users/$USER/.local/bin"
