export HOME=$(cd ~; pwd)
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='vim'

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="hostyle"

plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias src="source ~/.zshrc"

export PATH=$PATH:$HOME/.jenv/bin
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export ANDROID_HOME=/usr/local/share/android-sdk
export GOPATH=~/projects/go
export PATH=$PATH:$GOPATH/bin

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
