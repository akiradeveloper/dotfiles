#!/bin/sh

add_binpath_of()
{
  dir=$1
  path_bin=$dir/bin
  if [ -e $path_bin ]
  then
    echo "[add] $path_bin"
    PATH=$path_bin:$PATH
    export PATH
  fi
}

add_binpath_foreach()
{
  root_dir=$1
  if [ ! -d $root_dir ] 
  then
    return
  fi
  for dir in `ls -A $root_dir`
  do
    add_binpath_of $root_dir/$dir
  done
}

#
# Home
#
# add_binpath_foreach $HOME # don't do this
add_binpath_foreach $HOME/local
add_binpath_of $HOME/local
# PATH=$HOME/bin:$PATH # duplicated!
PATH=$HOME/Dotfiles/bin:$PATH # utilities (shared)
PATH=$HOME/.rbenv/shims:$PATH
PATH=$HOME/.cabal/bin:$PATH
eval "$(rbenv init)"
[[ -s $HOME/.pythonbrew/etc/bashrc ]] & source $HOME/.pythonbrew/etc/bashrc


#
# System
#
# libraries that may be used
PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
add_binpath_foreach /usr/local
add_binpath_of /usr/local
# PATH=/usr/local/vim/bin:$PATH
# PATH=/usr/local/ghc/bin:$PATH
# PATH=/usr/local/node/bin:$PATH
# PATH=$HOME/local/scala-2.10.1/bin:$PATH
# LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

export PATH

unset GIT_PROXY_COMMAND

# aliases
alias irb='rlwrap irb'
alias ls='ls --color=auto'
alias cl='clear'

export EDITOR=vi
export PAGER=less
export LANG=C

# sshfs -o sshfs_debug -o allow_root -o reconnect Kamille:/home/akira Kamille
