# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="futurepixels"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  composer
  docker
  fasd
  git
  npm
  systemd
  vi-like
)

source $ZSH/oh-my-zsh.sh

alias vi='vim'
alias project='teamocil'
alias copy='xclip -sel clip < $0'

compctl -g '~/.teamocil/*(:t:r)' teamocil

if command -v tmux > /dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
