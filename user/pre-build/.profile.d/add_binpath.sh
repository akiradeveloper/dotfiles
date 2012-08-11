#!/bin/sh

add_binpath_of(){
  dir=$1
  path_bin=$dir/bin
  if [ -e $path_bin ]
  then
    echo "[add] $path_bin"
    PATH=$path_bin:$PATH
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
add_binpath_of $HOME
