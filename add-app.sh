#!/bin/bash

echo Please provide some information about the application you want to add.
echo 
echo App ID/Folder Name: 
read id
echo 
echo App Name: 
read name
echo 
echo Developer: 
read dev 
echo 
echo URL: 
read url
echo 
echo Theme Icon \(null if there is none\): 
read themeicon
echo 
echo Summary/Short Description: 
read summary
echo 
echo Description: 
read description
echo 
echo Package Name \(pacman\): 
read package
echo 

mkdir -p "./applications/$id"
cat > "./applications/$id/metadata.conf" << EOL
NAME="${name}"
DEVELOPER="${dev}"
URL="${url}"
THEME_ICON="${themeicon}"
SUMMARY="${summary}"
DESCRIPTION="${description}"
PACKAGE="${package}"
EOL

echo Saved metadata.
echo 

echo Path to icon file \(*.png, null to force theme icon\): 
read iconpath
if [ ${iconpath} == "null" ]
then
    echo No icon file.
    echo 
else
    cp ${iconpath} ./applications/$id/icon.png
    echo Copied icon file.
    echo 
fi

read -p "Create post-install and post-remove script? [N/y] " -n 1 -r
echo  
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo Creating empty post-install and post-remove shell scripts.
    echo You can edit them later.
    touch ./applications/$id/post-install.sh
    touch ./applications/$id/post-remove.sh
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi
echo Done.
