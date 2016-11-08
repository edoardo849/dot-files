
cd $HOME

dotFiles=$HOME/.dotfiles
if [ ! -d "$dotFiles" ]; then
	git clone git@github.com:edoardo849/dot-files.git $dotFiles
fi


#pacmanPkgs = ()

supported_pkg () {
	echo 'Installing supported packages'

	sudo pacman -S \
		xf86-input-libinput \
		gnupg \
		redshift \
		ruby \
		zsh \
		zsh-completions \
		nodejs \
		npm \
		neovim \
		python2-neovim \
		python-neovim \
		jq \
		go \
		clang # for swift

}

community_pkg () {

	echo 'Installing community packages'

	yaourt \
		touchegg \
		google-chrome \
		spotify \
		insync \
		swift
}

# Install Gnupg
#if hash gpg 2>/dev/null; then
#	echo 'Gnupg already installed'
#else
#	echo 'Installing Gnupg'
#	sudo pacman -S gnupg
#fi

#if hash /usr/local/go/bin/go 2>/dev/null; then
#	echo 'GoLang already installed'
#else
#	echo 'Installing GoLang 1.7'
#	wget
#"https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz" -P /tmp && sudo tar -C /usr/local -xzf
#/tmp/go1.7.3.linux-amd64.tar.gz
#fi


#echo 'Setup Neovim and Plug'
#curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
	#
#https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#echo 'Installling Rust'
#curl -sSf https://static.rust-lang.org/rustup.sh | sh
# Code completion for rust
#cargo install racer

echo 'Setting up Development environment'
devDir=$HOME/Development
if [ ! -d "$devDir" ]; then
	mkdir $devDir
fi

#if hash terraform 2>/dev/null; then
#	echo 'Terraform already installed'
#else
#	echo 'Installing Terraform'
#	terraform_url=$(curl --silent
#https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')
#	terDir=$devDir/terraform
#	mkdir $terDir
#	curl -o $terDir/terraform.zip $terraform_url
#	cd $terDir
#	unzip terraform.zip
#	rm terraform.zip
#	cd $HOME
#fi

#echo 'Installing Amazon AWS CLI'
#curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o
#"/tmp/awscli-bundle.zip"
#cd /tmp
#unzip awscli-bundle.zip
#sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
#cd $HOME

goDir=$devDir/go
if [ ! -d "$goDir" ]; then
	echo "- Creating $goDir"
	mkdir $goDir
fi

vimFile=$HOME/.vimrc
if [ -f "$vimFile" ] && [ ! -L "$vimFile" ]; then
	echo "- Backing up $vimFile"
	mv $vimFile $vimFile.backup
fi

if [ ! -L "$vimFile" ]; then
	echo "- Linking $vimFile to $dotFiles"
	ln -s $dotFiles/init.vim $vimFile
fi

redshiftConf=$HOME/.config/redshift.conf
if [ -f "$redshiftConf" ] && [ ! -L "$redshiftConf" ]; then
	echo "- Backing up $redshiftConf"
	mv $redshiftConf $redshiftConf.backup
fi

if [ ! -L "$redshiftConf" ]; then
	echo "- Linking $redshiftConf to $dotFiles"
	ln -s $dotFiles/redshift.conf $redshiftConf
fi

vimConfig=$HOME/.config/nvim/init.vim
if [ -f "$vimConfig" ] && [ ! -L "$vimConfig" ]; then
	echo "- Backing up $vimConfig"
	mv $vimConfig $vimConfig.backup
fi

if [ ! -L "$vimConfig" ]; then
	echo "- Linking $vimConfig to $dotFiles"
	ln -s $dotFiles/init.vim $vimConfig
fi

vimColorFolder=$HOME/.vim/colors

if [ ! -L "$vimColorFolder" ]; then
	echo "- Backing up $vimColorFolder"
	ln -s $dotFiles/vim/colors $vimColorFolder
fi

# GIT Config
gitConfig=$HOME/.gitconfig
if [ -f "$gitConfig" ] && [ ! -L "$gitConfig" ]; then
	echo "- Backing up $gitConfig"
	mv $gitConfig $gitConfig.backup
fi

if [ ! -L "$gitConfig" ]; then
	echo "- Likning $gitConfig to $dotFiles"
	ln -s $dotFiles/gitconfig $gitConfig
fi

# ZSH Config
zshConfig=$HOME/.zshrc
if [ -f "$zshConfig" ] && [ ! -L "$zshConfig" ]; then
	echo "- Backing up $zshConfig"
	mv $zshConfig $zshConfig.backup
fi


if [ ! -f "$zshConfig" ] && [ ! -L "$zshConfig" ]; then
	echo "- Setting up Zsh"
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
fi


if [ ! -L "$zshConfig" ]; then
	echo "- Linking $zshConfig to $dotFiles"
	ln -s $dotFiles/zshrc.sh $zshConfig
fi

echo 'Installing js-beautify'
sudo npm install -g js-beautify

echo 'Success! Now run "chsh -s /bin/zsh" to setup zsh as the default shell and run :PlugInstall from within nvim'
