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

export GOPATH="$HOME/go"

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/Cellar/openssl/1.0.2r/bin:$PATH"
export PATH="/usr/local/opt/bison/bin:$PATH"

export EDITOR=vim
export GIT_EDITOR=vim

eval "$(anyenv init -)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(thefuck --alias)"

# aliases
alias ll='ls -laF'
alias lg='lazygit'
alias suizokukan='asciiquarium'

# ghq peco search
peco-src () {
    local repo=$(ghq list | peco --query "$LBUFFER")
    if [ -n “$repo” ]; then
        repo=$(ghq list --full-path --exact $repo)
        BUFFER="cd ${repo}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
