Dot Files
===

My DotFiles. This branch is meant to be installed on an [Antergos](https://antergos.com/) Arch Linux distribution. To set-up the system, just run:

```bash

bash <(curl -s https://raw.githubusercontent.com/edoardo849/dot-files/arch/install.sh)

```

https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.kxhx1wfbf

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
- http://nerditya.com/code/guide-to-neovim/

### Select Multiple lines
To select multiple lines, press v or V and then the arrow keys to go up and down. If the mappings are set up ar to sheerun's post, then do:
- `SPACE + y` to copy
- `SPACE + p` to paste
- `SPACE + d` to cut
- `CTRL + n` to multi-edit with [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) plugin

### NerdTree commands
Type :help NERDTreeMappings to read through all of the default keyboard shortcuts. These are the ones I use the most frequently:

t: Open the selected file in a new tab
i: Open the selected file in a horizontal split window
s: Open the selected file in a vertical split window
I: Toggle hidden files
m: Show the NERD Tree menu
R: Refresh the tree, useful if files change outside of Vim
?: Toggle NERD Tree's quick help

## Antergos
### Modify login background

```bash

# Copy any .jpg file into /usr/share/antergos/wallpapers
sudo cp path/to/file.jpg /usr/share/antergos/wallpapers

```


## Razer-blade
### Lid status

```bash

sudo nano /etc/default/grub

# Modify this line adding "button.lid_init_state=open"
GRUB_CMDLINE_LINUX_DEFAULT="quiet button.lid_init_state=open"

# And then automatically re-generate the grub.cfg file
grub-mkconfig -o /boot/grub/grub.cfg

```

Setup webcam

```bash
nvim /etc/modprobe.d/uvcvideo.conf

-----

## fix issue with built-in webcam
options uvcvideo quirks=512

```

## Post-installation

Install [timezones](https://github.com/jwendell/gnome-shell-extension-timezone) gnome shell extension.

```bash
mkdir -p ~/.local/share/gnome-shell/extensions

git clone https://github.com/jwendell/gnome-shell-extension-timezone.git ~/.local/share/gnome-shell/extensions/timezone@jwendell

gnome-shell-extension-tool -e timezone@jwendell

ln -s $HOME/.dotfiles/conf/gse-timezone_people.json people.json
```
