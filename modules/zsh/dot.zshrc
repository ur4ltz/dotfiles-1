#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/Cellar/openssl/1.0.2r/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

eval "$(anyenv init -)"

export EDITOR=vim
export GIT_EDITOR=vim
eval "$(direnv hook zsh)"

# random cowsay
# cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows | grep .cow | gshuf -n 1) $(fortune)

# history
HISTSIZE=50000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '

# the f*ck
eval "$(thefuck --alias)"

# alias
alias ll='ls -laF'
alias suizokukan='asciiquarium'

# functinos
function calc() {
  awk "BEGIN {print $*}"
}

# starship
eval "$(starship init zsh)"
