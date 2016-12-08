#!/bin/bash

# Globals
today=$(date +"%Y%m%d")
dotFilesDir="$HOME/.dotfiles"

if [ ! -d "$dotFilesDir" ]; then
	# Clone the latest repo
	git clone https://github.com/edoardo849/dot-files $dotFilesDir
fi

function ask_yes_or_no() {
	read -p "$1 ([y]es or [N]o): "
	case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
		y|yes) echo "yes" ;;
		*)     echo "no" ;;
	esac
}

install_pacman () {
	echo 'Installing Pacman packages'
	installPkgs=(
	'ffmpeg'
	'gnupg'
	'xf86-input-libinput'
	'redshift'
	'ruby'
	'zsh'
	'zsh-completions'
	'nodejs'
	'npm'
	'neovim'
	'python2-neovim'
	'python-neovim'
	'jq'
	'go'
	'clang'
	'gnome-keyring'
	'opera'
	'docker'
	'docker-compose'
	'libreoffice'
	)

	for i in "${installPkgs[@]}"
	do
		if [[ "no" == $(ask_yes_or_no "Install $i ?")  ]]
		then
			echo "$i skipped."
			continue
		else
			echo "Installing $i"
			sudo pacman -S $i
		fi

	done

}

install_yaourt () {
	echo 'Installing AUR packages'
	installPkgs=(
	'touchegg'
	'google-chrome'
	'spotify'
	'insync'
	)
	for i in "${installPkgs[@]}"
	do
		if [[ "no" == $(ask_yes_or_no "Install $i ?")  ]]
		then
			echo "$i skipped."
			continue
		else
			echo "Installing $i"
			yaourt $i
		fi

	done
}


remove_synaptic () {
	if [[ "no" == $(ask_yes_or_no "Remove Synaptic driver ?")  ]]
	then
		echo "Skipped."
		return 1
	else
		echo "Removing the synaptic Driver"

		sudo pacman -R xf86-input-synaptics
		sudo mv /etc/X11/xorg.conf.d/50-synaptics.conf ~/
	fi
}


install_rust () {
	if [[ "no" == $(ask_yes_or_no "Install Rust ?")  ]]
	then
		echo "Skipped."
		return 1
	else
		echo "Installing Rust"
		curl -sSf https://static.rust-lang.org/rustup.sh | sh
		cargo install racer
	fi
}


setup_neovim_zsh () {
	if [[ "no" == $(ask_yes_or_no "Setup NeoVim and ZSH ?")  ]]
	then
		echo "Skipped."
		return 1
	else
		echo "Installing Plug for NeoVIm"

		curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		echo "Installing patches for the Agnostic theme"
		git clone https://github.com/powerline/fonts
		bash fonts/install.sh
		rm -rf fonts
	fi

}

install_terraform () {

	if [[ "no" == $(ask_yes_or_no "Install Terraform ?")  ]]
	then
		echo "Skipped."
		return 1
	else
		bash $HOME/installers/install_terraform.sh
	fi
}

install_globalNpm () {
	echo 'Installing NPM global packages'
	installPkgs=('js-beautify')

	for i in "${installPkgs[@]}"
	do
		if [[ "no" == $(ask_yes_or_no "Install $i ?")  ]]
		then
			echo "$i skipped."
			continue
		else
			echo "Installing $i"
			sudo npm install -g $i
		fi

	done

}

install_amazonAWSCli () {
	if [[ "no" == $(ask_yes_or_no "Install AWS CLI ?")  ]]
	then
		echo "Skipped."
		continue
	else
		echo "Installing AWS CLI"
		cd /tmp
		curl -O https://bootstrap.pypa.io/get-pip.py
		sudo python get-pip.py
		sudo pip install awscli --ignore-installed six
		cd $HOME
	fi


}


install_gnomeExtensions() {
	if [[ "no" == $(ask_yes_or_no "Install GNOME extensions?")  ]]
	then
		echo "Skipped."
		return 1
	else
		# Installation Instructions from https://github.com/deadalnix/pixel-saver
		git clone git clone https://github.com/deadalnix/pixel-saver.git /tmp/pixel-saver
		cd /tmp/pixel-saver
		git checkout 1.9
		cp -r pixel-saver@deadalnix.me -t ~/.local/share/gnome-shell/extensions
		gnome-shell-extension-tool -e pixel-saver@deadalnix.me
		cd $HOME
	fi


}


link_dotfiles () {
	if [[ "no" == $(ask_yes_or_no "Link config to dotfiles ?")  ]]
	then
		echo "Skipped."
		return 1
	else
		echo "Linking..."
		backupExt="$today_backup"

		echo 'Setting up Development environment'
		devDir=$HOME/Development
		if [ ! -d "$devDir" ]; then
			mkdir $devDir
		fi

		goDir=$devDir/go
		if [ ! -d "$goDir" ]; then
			echo "- Creating $goDir"
			mkdir $goDir
		fi

		vimFile=$HOME/.vimrc
		if [ -f "$vimFile" ] && [ ! -L "$vimFile" ]; then
			echo "- Backing up $vimFile"
			mv $vimFile $vimFile.$backupExt
		fi

		if [ ! -L "$vimFile" ]; then
			echo "- Linking $vimFile to $dotFiles"
			ln -s $dotFiles/init.vim $vimFile
		fi

		redshiftConf=$HOME/.config/redshift.conf
		if [ -f "$redshiftConf" ] && [ ! -L "$redshiftConf" ]; then
			echo "- Backing up $redshiftConf"
			mv $redshiftConf $redshiftConf.$backupExt
		fi

		if [ ! -L "$redshiftConf" ]; then
			echo "- Linking $redshiftConf to $dotFiles"
			ln -s $dotFiles/conf/redshift.conf $redshiftConf
		fi

		vimConfig=$HOME/.config/nvim/init.vim
		if [ -f "$vimConfig" ] && [ ! -L "$vimConfig" ]; then
			echo "- Backing up $vimConfig"
			mv $vimConfig $vimConfig.$backupExt
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
			mv $gitConfig $gitConfig.$backupExt
		fi

		if [ ! -L "$gitConfig" ]; then
			echo "- Likning $gitConfig to $dotFiles"
			ln -s $dotFiles/conf/.gitconfig $gitConfig
		fi

		# ZSH Config
		zshConfig=$HOME/.zshrc
		if [ -f "$zshConfig" ] && [ ! -L "$zshConfig" ]; then
			echo "- Backing up $zshConfig"
			mv $zshConfig $zshConfig.$backupExt
		fi


		if [ ! -f "$zshConfig" ] && [ ! -L "$zshConfig" ]; then
			echo "- Setting up Zsh"
			sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
		fi


		if [ ! -L "$zshConfig" ]; then
			echo "- Linking $zshConfig to $dotFiles"
			ln -s $dotFiles/system/.zshrc $zshConfig
		fi

		echo 'Success! Now run "chsh -s /bin/zsh" to setup zsh as the default shell and run :PlugInstall from within nvim'
	fi
}



install_pacman

remove_synaptic

install_yaourt

install_gnomeExtensions

install_rust

setup_neovim_zsh

install_terraform

install_globalNpm

install_amazonAWSCli

link_dotfiles

# Enable SystemCtl daemons

# Docker
echo 'Enabling docker'
sudo gpasswd -a $USER  docker
sudo systemctl enable docker
sudo systemctl start docker

echo 'Starting insync'
insync start

echo 'Done. Import your gpg keys!'
