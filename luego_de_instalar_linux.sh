 #!/bin/bash

echo "********************"
echo "*Instalador de Joel*"
echo "********************"

echo "Instalando temas"
# Prerequisite
sudo apt-get install -y murrine-themes

# I do not use 'local' because it does not work properly (uncomment when it is fixed)
# if [ ! -d '/usr/local/share/themes' ]; then
#     sudo mkdir '/usr/local/share/themes'
# fi

cd /usr/share/themes/
sudo rm -rf Numix
sudo git clone https://github.com/shimmerproject/Numix.git

if [ ! -d '/usr/local/share/icons' ]; then
    sudo mkdir '/usr/local/share/icons'
fi

cd /usr/local/share/icons/
sudo rm -rf numix-icon-theme numix-icon-theme-circle Numix Numix-Light Numix-Circle Numix-Circle-Light

sudo git clone https://github.com/numixproject/numix-icon-theme.git
sudo mv numix-icon-theme/Numix ./
sudo mv numix-icon-theme/Numix-Light ./

sudo git clone https://github.com/numixproject/numix-icon-theme-circle.git
sudo mv numix-icon-theme-circle/Numix-Circle ./
sudo mv numix-icon-theme-circle/Numix-Circle-Light ./

sudo rm -rf numix-icon-theme numix-icon-theme-circle

echo "Poniendo todo al día"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

echo "QT 5"
sudo apt-get install -y qt5-default qtcreator qml-module-qtquick2 libqt5webkit5-dev libqt5svg5-dev

echo "Code Blocks"
sudo apt-get install -y codeblocks

echo "Graficos"
sudo apt-get install -y blender gimp imagemagick inkscape

echo "Musica"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get -y update
sudo apt-get install -y spotify-client

echo "Recomendaciones de instalación"
firefox http://www.howtogeek.com/howto/35807/how-to-harmonize-your-dual-boot-setup-for-windows-and-ubuntu/ http://microchip.wikidot.com/mplabx:installation

echo "Eso es todo"
