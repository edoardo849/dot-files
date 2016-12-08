

install_terraform () {
	echo 'Installing Terraform'
	terraform_url=$(curl --silent https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*64" | sort -rh | head -1 | awk -F[\"] '{print $4}')

	terDir=$HOME/.terraform
	mkdir -p $terDir
	curl -o $terDir/terraform.zip $terraform_url
	cd $terDir
	unzip terraform.zip
	rm terraform.zip
	cd $HOME
}

install_terraform
