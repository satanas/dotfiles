#!/usr/bin/zsh

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
NC="\033[0m" # No Color

link_file() {
  echo "Linking ${2}";
  ln -sf ${CONFIG_FILES_FULL_PATH}/${1} ${2}
}

check_deps() {
    if ! [ -x $(command -v $1)  ]; then
        return 1;
    else
        return 0;
    fi
}

create_dir() {
    if [[ ! -d $1 ]]; then
        echo "Creating directory $1"
        mkdir -p $1
    fi
}

error() {
    echo "${RED}Error: ${NC}$1"
    exit 1 || return 1
}

title() {
    echo "==> ${GREEN}$1${NC}"
}

title "Locating configuration files..."
CONFIG_FILES_DIR=config
if [[ ! -a $CONFIG_FILES_DIR ]]; then
    CONFIG_FILES_DIR=../config
    if [[ ! -a $CONFIG_FILES_DIR ]]; then
        error "This script must be run from its own directory"
    fi
fi
CONFIG_FILES_FULL_PATH=$(pwd)/$CONFIG_FILES_DIR
echo "Configurations files found at $CONFIG_FILES_FULL_PATH"

title "Checking Oh My Zsh"
if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Installing Oh My Zsh"
    ZSH=~/.oh-my-zsh && curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
else
    echo "✓ OyMyZsh already installed."
fi

title "Linking config files..."
create_dir ~/.vim/colors
create_dir ~/.oh-my-zsh/themes

link_file themes/solarized.vim ~/.vim/colors/solarized.vim
link_file .vimrc ~/.vimrc
link_file .zshrc ~/.zshrc
link_file themes/hostyle.zsh-theme ~/.oh-my-zsh/themes/hostyle.zsh-theme
link_file Brewfile ~/Brewfile

title "Setting up Homebrew..."
check_deps brew
if [[ $? != 0 ]]; then
    echo "Installing Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh || { error "Unable to install Homebrew. Exiting."; exit 1; }
else
    echo "✓ Homebrew already installed. Updating..."
    brew update
fi
cd ~
brew bundle ||

title "Sourcing the new ~/.zshrc"
source ~/.zshrc
echo "${CYAN}Configuration completed successfully!${NC}"
