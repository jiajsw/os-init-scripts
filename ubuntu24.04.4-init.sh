#!/usr/bin/env bash

# 卸载 snap 
sudo apt autoremove --purge snapd

sudo rm -rvf /tmp/snap-private-tmp/snap.snapd-desktop-integration/tmp/.snap/snap
sudo rm -rvf /home/jsw/snap
sudo rm -rvf /sys/fs/bpf/snap
sudo rm -rvf /root/snap
sudo rm -rvf /var/lib/gdm3/snap
sudo rm -rvf ~/snap

cat <<EOF | sudo tee /etc/apt/preferences.d/nosnap.pref > /dev/null
Package: snapd
Pin: release a=*
Pin-Priority: -10

Package: snap-confine
Pin: release a=*
Pin-Priority: -10

Package: ubuntu-core-launcher
Pin: release a=*
Pin-Priority: -10
EOF

# 验证拦截是否生效
# apt-cache policy snapd 

sudo apt install vim -y
# 设置行号 /etc/vim/vimrc
echo 'set nu' | sudo tee -a /etc/vim/vimrc

# 安装 gnome-software
sudo apt install --no-install-recommends gnome-software -y

sudo locale-gen en_US.UTF-8 zh_CN.UTF-8 

sudo apt install -y flatpak gnome-software-plugin-flatpak

sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub

flatpak update

cat << 'EOF' > ~/.bashrc
_OLD_PS1="$PS1"
_MY_VAR_INIT=1
PROMPT_COMMAND='PS1="$_OLD_PS1[$_MY_VAR_INIT]\n\\$ ";((_MY_VAR_INIT++))'
EOF

sudo apt update && sudo apt upgrade -y

sudo apt install -y fonts-firacode fonts-wqy-microhei fonts-wqy-zenhei

# 刷新字体
sudo fc-cache -f -v