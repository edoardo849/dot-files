Dot Files
===

Setup

```bash

# Install GoLang https://golang.org/doc/install
# if linux:
wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz


# clone the repo from the home dir
git clone git@github.com:edoardo849/dot-files.git .dotfiles

# Install neovim...

wget https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz# Install Plug Manager...
# https://github.com/junegunn/vim-plug

# Create symlinks
mv ~/.vimrc .vimrc.backup
ln -s ~/.dotfiles/init.vim .vimrc

mv ~/.config/nvim/init.vim ~/.config/nvim/init.vim.backup
ln -s ~/dot-files/init.vim  ~/.config/nvim/init.vim

# Install zsh...

# Symlink for zsh
mv ~/.zshrc ~/.zshrc.backup
ln -s ~/dot-files/zshrc.bash ~/.zshrc

# Symlink for git
ln -s ~/dot-files/gitconfig ~/.gitconfig

# Install dependencies for auto complete:
pacman -S nodejs npm
# https://docs.npmjs.com/getting-started/fixing-npm-permissions
# Fix npm permissions
npm config get prefix
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}

npm install -g js-beautify

# Install Racer, code completion for RUST https://github.com/phildawes/racer
cargo install racer

# Install python support https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
pip2 install --user neovim
pip3 install --user neovim

```


Cheatsheets:
- http://vim.rtorr.com/

Config:
- https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
- https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
- http://www.zhubert.com/blog/2014/02/11/setting-up-go/ GOPATH for zsh


Plugins:
- https://github.com/Chiel92/vim-autoformat Autoformatter


How Tos:

## Select Multiple lines
To select multiple lines, press v or V and then the arrow keys to go up and down. If the mappings are set up ar to sheerun's post, then do `SPACE + y` to copy and `SPACE + p` to paste.

## NerdTree commands
Type :help NERDTreeMappings to read through all of the default keyboard shortcuts. These are the ones I use the most frequently:

t: Open the selected file in a new tab
i: Open the selected file in a horizontal split window
s: Open the selected file in a vertical split window
I: Toggle hidden files
m: Show the NERD Tree menu
R: Refresh the tree, useful if files change outside of Vim
?: Toggle NERD Tree's quick help

