#!/bin/sh

. $HOME/erlang/17_1/activate

export PATH=$HOME/elixir/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/local/bin:$HOME/Dotfiles/bin:$HOME/local/scala/bin:$HOME/.cabal/bin:$HOME/.rbenv/shims:$PATH

export GOPATH=$HOME/_go
export GOROOT=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH


export NIMPATH=$HOME/Nim
export PATH=$HOME/.nimvm/bin:$HOME/.nimble/bin:$NIMPATH/bin:$PATH

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

eval "$(rbenv init)"

[[ -s $HOME/.pythonbrew/etc/bashrc ]] & source $HOME/.pythonbrew/etc/bashrc

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi
unset GIT_PROXY_COMMAND

# aliases
alias irb='rlwrap irb'
alias ls='ls --color=auto'
alias cl='clear'

export EDITOR=vi
export PAGER=less
export LANG=C

# sshfs -o sshfs_debug -o allow_root -o reconnect Kamille:/home/akira Kamille
