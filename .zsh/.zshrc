if (test -e $HOME/.rc.conf); then
  source $HOME/.rc.conf
else
  echo "~/.rc.conf does not exist!"
fi

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit -d $HOME/.zcompdump_${HOST}

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Basic PATH
export PATH=/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$PATH

if (test $REQUIRE_AUTH -eq 1); then
  if (test $BEHIND_PROXY -ne 1); then
    echo "BEHIND_PROXY does not set to 1 while REQURE_AUTH is set !"
    echo "Forcely set BEHIND_PROXY"
    export BEHIND_PROXY=1
  fi
fi

if (test $REQUIRE_AUTH -eq 1); then
  export http_proxy=http://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  export https_proxy=https://$PROXY_ID:$PROXY_PASSWD@$PROXY_IP:$PROXY_PORT/
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
fi

if (test $REQUIRE_AUTH -ne 1); then
  export http_proxy=http://$PROXY_IP:$PROXY_PORT/
  export https_proxy=https://$PROXY_IP:$PROXY_PORT/
  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
fi

# GIT_PROXY_COMMAND is too powerful.
# it overwrites core.gitProxy in ~/.gitconfig 
unset GIT_PROXY_COMMAND
if (test 0 -eq 1); then
  GIT_PROXY_COMMAND=git-proxy
fi

if (test $BEHIND_PROXY -ne 1); then
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset GIT_PROXY_COMMAND
fi

export EDITOR=vim
export PAGER=less

# aliases
alias vi='vim'
alias irb='rlwrap irb'
alias ls='ls --color'
alias cl='clear'

NBR_DIR=$HOME/nbr
mnt_home()
{
  if ! (test -e $NBR_DIR/$1); then
    mkdir -p $NBR_DIR/$1
  fi
  echo mounting a neighbor \($1\)
  sshfs -o reconnect $1:/home/akira $NBR_DIR/$1
  return 
}

for name in $NEIGHBORS; do
  mnt_home $name
done

if (test -e $HOME/.rc.local); then
  source $HOME/.rc.local
else
  echo "~/.rc.local does not exist!"
fi
