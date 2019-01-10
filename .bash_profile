#!/bin/sh

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# aliases
alias ls='ls --color=auto'
alias cl='clear'

export EDITOR=vi
export PAGER=less
export LANG=C
