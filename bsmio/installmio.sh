#!/bin/bash

if [ "$(whoami)" == "root" ]; then
    exit 1
fi

ruta=$(pwd)

# Actualizando el sistema
sudo parrot-upgrade

# Instalando dependencias de Entorno
sudo apt install -y build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev

#instalar bspwm
sudo apt install bspwm

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

#instalar kitty
#sudo apt install kitty -y

#intalar polybar
sudo apt install polybar 

#instalar cmake
sudo apt install cmake

#instalar picom
sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev meson ninja-build uthash-dev -y

#clonar el picom
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
sudo 7z x Hack.zip
sudo rm Hack.zip 
sudo rm LICENSE.md 
sudo rm README.md

#install zsh
sudo apt install zsh 

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
cd /home/bellze/fondo/
feh --bg-fill yuji-itadori-1920x1080-9268-222611746.jpg 

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

#instalar complementos de ;lla zsh
sudo apt install zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting

#ingresar zsh a root
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh $user
#cat /etc/passwd | grep -E "^$user|^root"

#instalar powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
instalacion root
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
sudo ln -s -fv ~/.zshrc /root/.zshrc

# Copia de configuracion de .p10k.zsh 
cp -v $ruta/.p10k.zsh ~/.p10k.zsh
sudo cp -v $ruta/.p10k.zsh /root/

#cpiar archvio .zshrc
rm -rf ~/.zshrc
cp -v $ruta/.zshrc ~/.zshrc

#para que no aparescar el erro con los autocompletados
chown root:root /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
chown root:root /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#installar batcat y lsd
cd  $ruta/
sudo dpkg -i bat_0.24.0_amd64.deb
sudo dpkg -i lsd_1.1.2_amd64.deb
sudo echo $LS_COLORS | sed 's/=01;/=/g'
export LS_COLORS="rs=0:di=34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=32:*.tar=31:*.tgz=31:*.arc=31:*.arj=31:*.taz=31:*.lha=31:*.lz4=31:*.lzh=31:*.lzma=31:*.tlz=31:*.txz=31:*.tzo=31:*.t7z=31:*.zip=31:*.z=31:*.dz=31:*.gz=31:*.lrz=31:*.lz=31:*.lzo=31:*.xz=31:*.zst=31:*.tzst=31:*.bz2=31:*.bz=31:*.tbz=31:*.tbz2=31:*.tz=31:*.deb=31:*.rpm=31:*.jar=31:*.war=31:*.ear=31:*.sar=31:*.rar=31:*.alz=31:*.ace=31:*.zoo=31:*.cpio=31:*.7z=31:*.rz=31:*.cab=31:*.wim=31:*.swm=31:*.dwm=31:*.esd=31:*.avif=35:*.jpg=35:*.jpeg=35:*.mjpg=35:*.mjpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.webp=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.ogv=35:*.ogx=35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:"

#configurar current y launch de polybar
cp -v $ruta/Config/polibar/launch.sh ~/.config/polybar
cp -v $ruta/Config/polibar/current.ini ~/.config/polybar
cp -v $ruta/Config/polibar/workspace.ini ~/.config/polybar

#copiar scrips 
cp -v $ruta/scrips/ethernet_status.sh ~/.config/bspwm/scripts
cp -v $ruta/scrips/vpn_status.sh ~/.config/bspwm/scripts
cp -v $ruta/scrips/target_to_hack.sh ~/.config/bspwm/scripts
cd ~/.config/bspwm/scripts
chmod +x ethernet_status.sh
chmod +x vpn_status.sh
chmod +x target_to_hack.sh

#creear carpeta bin
cd ~/.config
mkdir bin
cd ~/.config/bin
touch target

#instalar fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install 
#root
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
sudo ~/.fzf/install 

#Instalar neovi
#sudo apt remove nvim
sudo apt remove neovim
cd ~/github
git clone https://github.com/NvChad/starter ~/.config/nvim 

#instalar neovimgit
cd /opt
sudo mkdir nvim
cd /opt/nvim
sudo cp -r $ruta/nvim-linux64.tar.gz .
sudo tar -xf nvim-linux64.tar.gz
sudo rm nvim-linux64.tar.gz

#Configuracion de nvim
cp -v $ruta/nvimfile/init.lua ~/.config/nvim

#Intalar locate
sudo apt install locate
sudo umount /run/user/1000/doc
sudo umount /run/user/1000/gvfs
sudo updatedb

#crear tema para rofi
cd ~/.config
mkdir rofi
cd ~/.config/rofi
mkdir themes
cd ~/.config/rofi/themes 
cd /opt
sudo git clone https://github.com/newmanls/rofi-themes-collection.git
cd /opt/rofi-themes-collection/themes
sudo cp * ~/.config/rofi/themes/

#instalar i3lock
sudo apt install i3lock
cd /opt
sudo git clone https://github.com/meskarune/i3lock-fancy.git
cd /opt/i3lock-fancy
sudo make install
sudo apt install imagemagick
sudo apt update

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#utiliar este comando ya al finalizar toda la instalacion
#kill -9 -1
