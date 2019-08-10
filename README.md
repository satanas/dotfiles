Vim Configuration Files
=======================

This is my personal configuration for Vim.

Installation
============

To install it you can copy the files to your `.vim` folder or just symlink them from the git repo (preferred):

```
git clone git://github.com/satanas/vim-config.git my_project_folder
mkdir ~/.vim
ln -s my_project_folder/.vim/colors ~/.vim/colors
ln -s my_project_folder/.vimrc ~/.vimrc
```

After that open vim and it should install all your plugins automatically. If that doesn't happen, just execute:
```
:PluginInstall!
```

