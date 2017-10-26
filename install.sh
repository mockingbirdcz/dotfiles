#!/bin/sh

function getYaourt {
	echo "This definitely not stolen function will install and configure Yaourt."
	base=$(pacman -Qs base-devel)
	if [[ $base == "" ]]; then
		echo "You don't have base-devel group package. It'll be installed now."
    		pacman -S base-devel
	else
		echo "Retrieving package-query..."
    		curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
    		echo "Uncompressing package-query..."
    		tar zxvf package-query.tar.gz
    		cd package-query
    		echo "Installing package-query..."
    		makepkg -si --noconfirm
    		cd ..
    		echo "Retrieving yaourt ..."
    		curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
    		echo "Uncompressing yaourt..."
    		tar zxvf yaourt.tar.gz
    		cd yaourt
    		echo "Installing yaourt..."
    		makepkg -si --noconfirm
    		echo "Done!"
  	fi  
}

echo "------------------------------------------------------------------------------"
getYaourt
echo "------------------------------------------------------------------------------"
