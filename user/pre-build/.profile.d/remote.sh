#!/bin/sh

REMOTE_DIR=$HOME/remote
mnt_home(){
  if ! [ -e $REMOTE_DIR/$1 ]
  then
    mkdir -p $REMOTE_DIR/$1
  fi
  echo mounting a remote directory \($1\)
  sshfs -o allow_root -o reconnect $1:/home/akira $REMOTE_DIR/$1
  return 
}

for name in $DOTFILES_REMOTES
do
  mnt_home $name
done
