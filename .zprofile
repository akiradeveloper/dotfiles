unset GIT_PROXY_COMMAND

# aliases
alias irb='rlwrap irb'
alias ls='ls --color=auto'
alias cl='clear'

add_binpath_of(){
  dir=$1
  path_bin=$dir/bin
  if [ -e $path_bin ]
  then
    echo "[add] $path_bin"
    PATH=$path_bin:$PATH
    export PATH
  fi
}

add_binpath_foreach(){
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

add_binpath_foreach $HOME
add_binpath_foreach $HOME/local
add_binpath_of $HOME

PATH=$HOME/bin:$PATH
PATH=$HOME/Dotfiles/bin:$PATH
PATH=$HOME/.rbenv/shims:$PATH
PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/vim/bin:$PATH
PATH=/usr/local/ghc/bin:$PATH
PATH=/usr/local/node/bin:$PATH
PATH=$HOME/src/scala-2.10.1/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
export PATH

#LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

export EDITOR=vim
export PAGER=less
export LANG=C

eval "$(rbenv init)"
[[ -s $HOME/.pythonbrew/etc/bashrc ]] & source $HOME/.pythonbrew/etc/bashrc

#sshfs -o sshfs_debug -o allow_root -o reconnect Kamille:/home/akira Kamille
