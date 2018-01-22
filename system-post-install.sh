#!/bin/bash
function print_setup {
    echo "[SYSTEM SETUP] $1"
    sleep 1
}

print_setup "Installing aptitude..."
apt-get install aptitude -y

print_setup "Adding PPAs..."
add-apt-repository ppa:webupd8team/sublime-text-2 -y
add-apt-repository ppa:vincent-c/nevernote -y
apt-add-repository ppa:jtaylor/keepass -y
add-apt-repository ppa:webupd8team/atom -y
add-apt-repository ppa:mehanik/ksuperkey
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner" -y
add-apt-repository ppa:pbek/qownnotes -y

sudo aptitude update

print_setup "Installing updates..."
aptitude upgrade -y

print_setup "Installing packages..."
aptitude install -y terminator arj zip unzip rar unrar krename krusader unace samba aptitude vim transmission-gtk fish kget kompare pidgin skype ubuntu-gnome-desktop gnome-session samba git maven cmake vim dropbox grive sublime-text htop nixnote apcalc gufw monodevelop monodevelop-nunit mono-complete docker.io cmake-qt-gui texlive-fonts-recommended texlive-fonts-extra texlive-latex-base texlive-lang-polish texlive-latex-extra texlive-science texmaker gimp mplayer2 octave keepass2 myspell-pl virtualbox-qt nautilus-dropbox curl httpie tree tmux xsane atom nmon wireshark-qt python-pip thefuck ksuperkey sshpass libgnome2-gconf-perl libexpect-perl libnet-proxy-perl libyaml-perl libcrypt-cbc-perl libcrypt-blowfish-perl libgtk2-gladexml-perl libgtk2-ex-simple-list-perl libnet-arp-perl libossp-uuid-perl libcrypt-rijndael-perl libgtk2-unique-perl libxml-xpath-perl jq ctags

print_setup "Setting fish as primary console..."
usermod -s /usr/bin/fish pfus

# print_setup "Installing switch-to-workspace shortcuts..."
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 '["<Primary>KP_1"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 '["<Primary>KP_2"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 '["<Primary>KP_3"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 '["<Primary>KP_4"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 '["<Primary>KP_5"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 '["<Primary>KP_6"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-7 '["<Primary>KP_7"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-8 '["<Primary>KP_8"]'
# gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-9 '["<Primary>KP_9"]'

print_setup "Setting up crontab..."
crontab -u pfus crontab

print_setup "Installing sensors..."
aptitude install lm-sensors -y
sensors-detect

#print_setup "Setting up Docker"
#wget -qO- https://get.docker.com/ | sh
#curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
#chmod +x /usr/local/bin/docker-compose
#usermod -a -G docker pfus
#mkdir /docker
#echo "DOCKER_OPTS="$DOCKER_OPTS -g /docker" >> /etc/default/docker.io

print_setup "Setting up HP All-in-One"
hp-setup -i 192.168.1.20

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || cd ~/.vim/bundle/Vundle.vim && git pull && cd -
