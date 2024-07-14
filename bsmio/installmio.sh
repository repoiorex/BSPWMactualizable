#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Actualizando el sistema

sudo parrot-upgrade

# Instalando dependencias de Entorno

sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev


# Creando carpeta de Reposistorios

mkdir ~/github

# clonar repositorios de bspwm y sxhkd
cd ~/github
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git

#instalar bspwm
cd ~/github/bspwm
make
sudo make install

#instalar sxhkd
cd ~/github/sxhkd
make
sudo make install

#crear repositorios de bs y sxhkd
mkdir ~/.config/{bspwm,sxhkd}

#copiar bspwmrc a ~/.config/
cd  $ruta/Config/bspwm
cp -p bspwmrc ~/.config/bspwm/

#copiar sxhkdrc a ~/.config/
cd  $ruta/Config/sxhkd
cp -p sxhkdrc ~/.config/sxhkd/

#copiar carpeta scrip
cd  $ruta/Config/bspwm
cp -r scripts /home/bellze/.config/bspwm/
sudo apt install bspwm
#instalar kitty
#sudo apt install kitty -y

#intalar polybar
sudo apt install polybar -y

#instalar picom
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

#clonar el picom
#utilizar si no te corre con la instalacion de los paquetes de arriba sudo apt install cmake
sudo apt install cmake
cd ~/github
git clone https://github.com/yshui/picom
cd picom/ 
meson setup --buildtype=release build
ninja -C build
ninja -C build install

#instalar rofi
#una ves ya instalado todo en el archivo de sxhkdrc cambiar el comando de teclas y la direccion
sudo apt install rofi

# instalar 7z
sudo apt install p7zip-full

#instalar nerd fonts
cd  $ruta/Config/
sudo cp -r fonts /usr/local/share/
cd /usr/local/share/fonts/
7z x Hack.zip
sudo rm Hack.zip 
sudo rm LICENSE.md 
sudo rm README.md

#install zsh
sudo apt install zsh -y

#instalar ultima version kitty, siempre actualizar paquete desde la git y escoger la que dice amd 64 binary bundle, removeremos la kitty instalada para poner la ultima vercion
cd /opt/
sudo apt remove kitty -y //Se queda asi ya que no se elimina nada porque no se instala una kitty anterior
sudo mv $ruta/kitty/kitty-0.35.2-x86_64.txz /opt/ 
sudo 7z x kitty-0.35.2-x86_64.txz
sudo rm kitty-0.35.2-x86_64.txz
sudo mkdir kitty
sudo mv kitty-0.35.2-x86_64.tar kitty
cd /opt/kitty/
sudo tar -xf kitty-0.35.2-x86_64.tar 
sudo rm kitty-0.35.2-x86_64.tar 
./kitty --version

#copiar archivo color y conf de kitty para los atajos y colo de la terminal
cd  $ruta/Config/kitty
cp -p color.ini  ~/.config/kitty
cp -p kitty.conf ~/.config/kitty

#copiar los archivos kitty para que los tenga en user  root
sudo cp -rv $ruta/Config/kitty /root/.config/

# instalar visualizador de imagenes
sudo apt install imagemagick -y
sudo apt install feh -y

#configurar fondo
cd  $ruta/
sudo cp -r fondo /home/bellze/
sudo cd /home/bellze/fondo/
sudo feh --bg-fill yuji-itadori-1920x1080-9268-222611746.jpg 

#clonar repositorio para poly	
cd ~/github
git clone https://github.com/VaughnValle/blue-sky.git
cd ~/github/blue-sky/polybar
cp -r * ~/.config/polybar
sudo cp fonts/* /usr/share/fonts/truetype/
sudo fc-cache -v


#configuracion de picom
cd  $ruta/Config
cp -r picom ~/.config/

# Actualizando el sistema despues de instalacion

#sudo apt update

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#utiliar este comando ya al finalizar toda la instalacion
#kill -9 -1
