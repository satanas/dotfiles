#!/bin/sh

set -e

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
BLUE="\033[38;5;32m"
NC="\033[0m" # No Color

error() {
    echo "${RED}Error: ${NC}$1"
    exit 1 || return 1
}

title() {
    echo "${BLUE}==>${NC} $1"
}

ok() {
    echo "${GREEN}$1${NC}"
}


title "Setting up Oh My Zsh"
# Check for Oh My Zsh and install if we don't have it
if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Installing Oh My Zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ok "✓ OyMyZsh installed."
else
    ok "✓ OyMyZsh already installed."
fi

title "Setting up Homebrew"
if test ! $(which brew); then
    echo "Installing Homebrew..."
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh || { error "✗ Unable to install Homebrew."; exit 1; }
    ok "✓ Homebrew installed."
else
    ok "✓ Homebrew already installed."
fi

DOTFILES=~/projects/dotfiles
title "Setting up dotfiles repo"
cd ~

if [ -d "${DOTFILES}" ]; then
  echo "Dotfiles repo already present. Fetching latest changes..."
  cd "${DOTFILES}" && git pull origin master > /dev/null
  ok "✓ Dotfiles updated"
else
  echo "Cloning dotfiles repo..."
  git clone https://github.com/satanas/dotfiles.git
  cd ${DOTFILES}
  ok "✓ Dotfiles installed"
fi

# Install apps first, so we have stow available
cd ~
brew update
title "Installing applications"
brew bundle --file=~/dotfiles/config/Brewfile

cd ${DOTFILES}

title "Linking dotfiles"
for filename in $(ls config);
do
  if [ -d "${filename}" ]; then
    stow -R ${filename}
    echo "✓ Linked ${filename}"
  fi
done;

title "Sourcing the new ~/.zshrc"
source ~/.zshrc
echo "${CYAN}Configuration completed successfully!${NC}"
