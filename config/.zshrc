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
export GOOGLE_APPLICATION_CREDENTIALS="/opt/email-subscription-from-hell-0321865aba30.json"

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

#[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google-cloud-sdk/completion.zsh.inc'; fi

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
