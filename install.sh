
dotFiles=$HOME/.dotfiles
if [ ! -d "$dotFiles" ]; then
	git clone git@github.com:edoardo849/dot-files.git $dotFiles
fi

# Install Redshift
if hash redshift 2>/dev/null; then
	echo 'Redshift already installed'
else
	echo 'Installing Redshift'
	sudo pacman -S redshift
fi
# Install Ruby
if hash ruby 2>/dev/null; then
	echo 'Ruby already installed'
else
	echo 'Installing Ruby'
	sudo pacman -S ruby
fi

# Install Google Chrome
if hash google-chrome-stable 2>/dev/null; then
	echo 'Google Chrome already installed'
else
	echo 'Installing Google Chrome'
	yaourt google-chrome
fi
# Install Spotify
if hash spotify 2>/dev/null; then
	echo 'Spotify already installed'
else
	echo 'Installing Spotify'
	yaourt spotify
fi

# Install Golang
if hash /usr/local/go/bin/go 2>/dev/null; then
	echo 'GoLang already installed'
else
	echo 'Installing GoLang'
	wget "https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz" -P /tmp && sudo tar -C /usr/local -xzf /tmp/go1.7.3.linux-amd64.tar.gz
fi

if hash zsh 2>/dev/null; then
	echo 'Zsh already installed'
else
	echo 'Installing Zsh'
	sudo pacman -S zsh zsh-completions
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	chsh -s /bin/zsh
fi

# NodeJS
if hash node 2>/dev/null; then
	echo 'Nodejs already installed'
else
	echo 'Installing Nodejs'
	sudo pacman -S nodejs npm
fi

if hash nvim 2>/dev/null; then
	echo 'Neovim already installed'
else
	echo 'Installing Neovim'
	sudo pacman -S neovim python2-neovim python-neovim
	echo 'Installing Plug'
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if hash rustc 2>/dev/null; then
	echo 'Rust already installed'
else
	echo 'Installing Rust'
	curl -sSf https://static.rust-lang.org/rustup.sh | sh
	# Code completion for rust
	cargo install racer
fi

if hash jq 2>/dev/null; then
	echo 'JQ already installed'
else
	echo 'Installing JQ'
	sudo pacman -S jq
fi

echo 'Setting up Development environment'
devDir=$HOME/Development
if [ ! -d "$devDir" ]; then
	mkdir $devDir
fi

if hash terraform 2>/dev/null; then
	echo 'Terraform already installed'
else
	echo 'Installing Terraform'
	terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
	terDir=$devDir/terraform
	mkdir $terDir
	curl -o $terDir/terraform.zip $terraform_url
	cd $terDir
	unzip terraform.zip
	rm terraform.zip
	cd $HOME
fi

goDir=$devDir/go
if [ ! -d "$goDir" ]; then
	mkdir $goDir
fi

vimFile=$HOME/.vimrc
if [ -f "$vimFile" ] && [ ! -L "$vimFile" ]; then
	mv $vimFile $vimFile.backup
fi

if [ ! -L "$vimFile" ]; then
	ln -s $dotFiles/init.vim $vimFile
fi

vimConfig=$HOME/.config/nvim/init.vim
if [ -f "$vimConfig" ] && [ ! -L "$vimConfig" ]; then
	mv $vimConfig $vimConfig.backup
fi

if [ ! -L "$vimConfig" ]; then
	ln -s $dotFiles/init.vim $vimConfig
fi

vimColorFolder=$HOME/.vim/colors

if [ ! -L "$vimColorFolder" ]; then
	ln -s $dotFiles/vim/colors $vimColorFolder
fi

# GIT Config
gitConfig=$HOME/.gitconfig
if [ -f "$gitConfig" ] && [ ! -L "$gitConfig" ]; then
	mv $gitConfig $gitConfig.backup
fi

if [ ! -L "$gitConfig" ]; then
	ln -s $dotFiles/gitconfig $gitConfig
fi

# ZSH Config
zshConfig=$HOME/.zshrc
if [ -f "$zshConfig" ] && [ ! -L "$zshConfig" ]; then
	mv $zshConfig $zshConfig.backup
fi

if [ ! -L "$zshConfig" ]; then
	ln -s $dotFiles/zshrc.sh $zshConfig
fi

sudo npm install -g js-beautify
