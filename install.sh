#!/bin/sh

set -e

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
BLUE="\033[1;34m"
BOLD="\033[1;1m"
NO_FORMAT="\033[0m" # No Color

error() {
    echo "${RED}Error: ${NO_FORMAT}$1"
    exit 1 || return 1
}

title() {
    echo "${BLUE}==>${NO_FORMAT} ${BOLD}$1${NO_FORMAT}"
}

ok() {
    echo "${GREEN}$1${NO_FORMAT}"
}

SOURCE_DIR=$(pwd)

title "Setting up Oh My Zsh"
# Check for Oh My Zsh and install if we don't have it
if [[ ! -d ~/.oh-my-zsh ]]; then
    echo "Installing Oh My Zsh"
    curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh || { error "✗ Unable to install Oh My Zsh."; exit 1; }
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

title "Setting up dotfiles repo"
DOTFILES=~/projects/dotfiles
if [ -d "${DOTFILES}" ]; then
  echo "Dotfiles repo already present. Fetching latest changes..."
  cd "${DOTFILES}" && git pull origin master > /dev/null
  ok "✓ Dotfiles updated."
else
  echo "Cloning dotfiles repo..."
  git clone https://github.com/satanas/dotfiles.git ${DOTFILES}
  cd ${DOTFILES}
  ok "✓ Dotfiles cloned."
fi

# Install apps first, so we have stow available
cd ~
brew update
BREWFILE=${DOTFILES}/config/Brewfile
title "Installing applications from ${BREWFILE}"
brew bundle --file=${BREWFILE}

# Removes .zshrc from $HOME (if it exists)
rm -rf ~/.zshrc

cd ${DOTFILES}/config

title "Linking dotfiles"
for filename in $(ls .);
do
  if [ -d "${filename}" ]; then
    stow -R ${filename} -t ~
    echo "✓ Linked ${filename}"
  fi
done;

echo "${CYAN}Configuration completed successfully!${NO_FORMAT}"
title "Switching to zsh"
cd $SOURCE_DIR
exec zsh
source ~/.zshrc
