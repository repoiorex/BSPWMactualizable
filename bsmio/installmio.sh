#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Actualizando el sistema

#sudo parrot-upgrade

# Instalando dependencias de Entorno

#sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev


# Creando carpeta de Reposistorios

#mkdir ~/github

# clonar repositorios de bspwm y sxhkd
#cd ~/github

#git clone https://github.com/baskerville/bspwm.git

#git clone https://github.com/baskerville/sxhkd.git

#instalar bspwm
#cd ~/github/bspwm
#make
#sudo make install

#instalar sxhkd
#cd ~/github/sxhkd
#make
#sudo make install

#crear repositorios de bs y sxhkd

#mkdir ~/.config/{bspwm,sxhkd}

#copiar bspwmrc a ~/.config/

#cd  $ruta/Config/bspwm
#cp -p bspwmrc ~/.config/bspwm/

#copiar sxhkdrc a ~/.config/
#cd  $ruta/Config/sxhkd
#cp -p sxhkdrc ~/.config/sxhkd/

#copiar carpeta scrip
cd  $ruta/Config/bspwm

cp -r scripts /home/bellze/.config/bspwm/

#instalar kitty
#sudo apt install kitty -y

#intalar polybar
#sudo apt install polybar -y

#instalar picom

#sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

#clonar el picom
#utilizar si no te corre con la instalacion de los paquetes de arriba sudo apt install cmake
#cd ~/github
#git clone https://github.com/yshui/picom
#cd picom/ 
#meson setup --buildtype=release build
#ninja -C build
#ninja -C build install

#instalar rofi
#una ves ya instalado todo en el archivo de sxhkdrc cambiar el comando de teclas y la direccion
#sudo apt install rofi


# Actualizando el sistema despues de instalacion

#sudo apt update

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#utiliar este comando ya al finalizar toda la instalacion
#kill -9 -1

