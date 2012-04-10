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

export PATH=/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$HOME/.cabal/bin:$PATH
export EDITOR=vim

if (test -e $HOME/.cabal); then
  export PATH=$HOME/.cabal/bin:$PATH
fi

if (test -e $HOME/.rvm); then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] & . "$HOME/.rvm/scripts/rvm" 
fi

if (test -e $HOME/perl5/perlbrew); then
  source $HOME/perl5/perlbrew/etc/bashrc
fi

# aliases
alias vi='vim'
alias irb='rlwrap irb'
alias ls='ls --color'

if (test -e $HOME/.zshrc.local); then
  source $HOME/.zshrc.local
fi

mnt_home()
{
  if ! (test -e $HOME/nbr/$1); then
    mkdir -p $HOME/nbr/$1
  fi
  echo mounting \(neighbor\)$1
  # sshfs -o reconnect -o SSHOPT="ConnectTimeout 1" $1:/home/akira $HOME/nbr/$1
  sshfs -o reconnect $1:/home/akira $HOME/nbr/$1
  return 
}

for name in $NEIGHBORS; do
  mnt_home $name
done
