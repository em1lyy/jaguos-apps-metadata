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
echo Path to Icon file \(*.png, NONE for force Theme Icon\): 
read iconpath
if [${iconpath} = "NONE"]
then
    echo No Icon.
else
    cp ${iconpath} ./applications/$name/icon.png
fi
echo Icon copied.

echo Creating empty post-install and post-remove shell files...
echo You can edit them later.
echo "" >> ./applications/$name/postinstall.sh
echo "" >> ./applications/$name/postremove.sh
echo Done.
