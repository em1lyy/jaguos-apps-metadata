#!/bin/bash

echo Please provide some information about the App you want to add.
echo App Name: 
read name
echo Developer: 
read dev 
echo URL: 
read url
echo Theme Icon: 
read themeicon
echo Summary/Short Description: 
read summary
echo Description: 
read description
echo Package Name \(pacman\): 
read package

mkdir -p ./applications/$name
cat > ./applications/$name/metadata.conf << EOL
NAME="${name}"
DEVELOPER="${dev}"
URL="${url}"
THEME_ICON="${themeicon}"
SUMMARY="${summary}"
DESCRIPTION="${description}"
PACKAGE="${package}"
EOL

echo Metadata saved.
echo Path to icon file \(*.png, null to force theme icon\): 
read iconpath
if [${iconpath} = "NONE"]
then
    echo No icon.
else
    cp ${iconpath} ./applications/$name/icon.png
    echo Icon copied.
fi

read -p "Create post-install and post-remove script? " -n 1 -r
echo  
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo Creating empty post-install and post-remove shell scripts.
    echo You can edit them later.
    touch ./applications/$name/post-install.sh
    touch ./applications/$name/post-remove.sh
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
echo Done.
