
function ask_yes_or_no() {
	read -p "$1 ([y]es or [N]o): "
	case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
		y|yes) echo "yes" ;;
		*)     echo "no" ;;
	esac
}



clone_repos () {
	echo 'Cloning development repos'
	installPkgs=(
	'gnupg'
	'xf86-input-libinput'
	'redshift' 'ruby' 'zsh' 'zsh-completions' 'nodejs' 'npm'  'neovim' 'python2-neovim' 'python-neovim' 'jq' 'go' 'clang' 'gnome-keyring' 'opera' 'docker' 'geth' )

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


