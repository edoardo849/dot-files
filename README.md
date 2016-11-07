Dot Files
===
To Install on [Antergos](https://antergos.com/) Arch, just run:

```bash

sh -c "$(wget https://raw.githubusercontent.com/edoardo849/dot-files/arch/install.sh)"

```

This script will setup the standard programming environment with:
- Golang
- Rust
- Ruby
- NodeJS
- Google Chrome
- Spotify
- Redshift
- NeoVim
- Oh My Zsh
- ... several dependencies.

To fine-tune the system, visit the [Razer Blade Stealth Arch](https://wiki.archlinux.org/index.php/Razer) wiki page.

## NeoVim
Cheatsheets:
- http://vim.rtorr.com/

Config:
- https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
- https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
- http://www.zhubert.com/blog/2014/02/11/setting-up-go/ GOPATH for zsh


Plugins:
- https://github.com/Chiel92/vim-autoformat Autoformatter


How Tos:

### Select Multiple lines
To select multiple lines, press v or V and then the arrow keys to go up and down. If the mappings are set up ar to sheerun's post, then do `SPACE + y` to copy and `SPACE + p` to paste.

### NerdTree commands
Type :help NERDTreeMappings to read through all of the default keyboard shortcuts. These are the ones I use the most frequently:

t: Open the selected file in a new tab
i: Open the selected file in a horizontal split window
s: Open the selected file in a vertical split window
I: Toggle hidden files
m: Show the NERD Tree menu
R: Refresh the tree, useful if files change outside of Vim
?: Toggle NERD Tree's quick help

