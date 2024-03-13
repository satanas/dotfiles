# Dot Files

This repository serves as my way to help me setup and maintain my configuration files. It takes the effort out of
installing everything manually. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

# What's included?

* OhMyZsh configured with my preferences and my own theme `Hostyle`.
* Vim configured with all my plugins, airline and `solarized` theme.
* Homebrew formulas and apps installed via `Brewfile`.
* Karabiner setup
* Git config
* Docker config
* Bundler config
* AWS CLI config

## Using GNU Stow
> GNU Stow is a symlink farm manager which takes distinct sets of software and/or data located in separate directories on the filesystem, and makes them all appear to be installed in a single directory tree.

# Installation

## First time setup:
```
sh -c "$(curl -H 'Cache-Control: no-cache' -fsSL https://raw.githubusercontent.com/satanas/dotfiles/master/install.sh)"
```

## Re-execute once everything is installed
```
cd ~/projects/dotfiles
./install.sh
```


## References
* https://github.com/cchacin/dotfiles
* https://github.com/webpro/dotfiles
* https://github.com/driesvints/dotfiles
* https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
