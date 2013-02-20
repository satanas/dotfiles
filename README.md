Vim Configuration Files
=======================

This is my personal configuration for Vim. It's inspired by [fisa-vim-config](https://github.com/fisadev/fisa-vim-config) but with a less stuffs.

Installation
============

To install it copy the files to your .vim folder. I prefer to clone the repo to and then make a symlink to .vim:

```
git clone git://github.com/satanas/vim-config.git my_preferred_folder
ln -ls my_preferred_folder/.vim ~/.vim
ln -ls my_preferred_folder/.vimrc ~/.vimrc
```

After that open vim and execute:

```
:BundleInstall!
```

