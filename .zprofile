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

PATH=$HOME/Dotfiles/bin:$PATH
PATH=$HOME/.rbenv/shims:$PATH
PATH=/usr/local/sbin:/usr/sbin:/sbin:$PATH
PATH=/usr/local/bin:$PATH
export PATH

export EDITOR=vim
export PAGER=less
export LANG=C

eval "$(rbenv init)"
