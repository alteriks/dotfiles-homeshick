# Qualia for managing dotfiles configuration
pacman --noconfirm -Syu python-pip python2-pip ruby icedtea-web jre8-openjdk python-urwid
pip install mir.qualia 

# Laptop
pip install \ 
    acpi_call \
    fwupd \
    powerstat \
    s-tui \
    tlp \
    tlp-rdw \
    undervolt

pacman --noconfirm -Syu \
    yubikey-manager-qt \
    yubioath-desktop

# Enable for ykman/ykman-gui (yubikey-manager-qt)
systemctl enable --now pcscd

pacman --noconfirm -Syu \
    arandr \
    i3blocks \
    i3lock-color \
    keepassxc \
    nemo \
    picom \
    redshift \
    rofi \
    termite \
    xclip \
    xorg-xbacklight \
    xss-lock \
    zathura-pdf-mupdf 
pacman --noconfirm -Syu \
    acpi \
    bc \
    bind-tools \
    fzf \
    fd \
    i7z \
    jq \
    lftp \
    lsof \
    mc \
    mtr \
    neovim \
    net-tools \
    nnn \
    pkgfile \
    rsync \
    screen \
    strace \
    sysstat \
    tcpdump \
    the_silver_searcher \
    tmux \
    unace \
    unarj \
    unrar \
    unzip \
    usleep \
    wget \
    zip 

pacman --noconfirm -Syu \
    cmake \
    gcc \
    pkg-config

pacman -Syu dmidecode lshw xsensors
pacman -Syu bridge-utils extra/networkmanager-openvpn easy-rsa dnsmasq wireshark-gtk 
pacman -Syu qemu virt-manager virt-viewer vagrant chrony
pacman -Syu libreoffice-still nomacs
pacman -Syu tigervnc remmina rdesktop freerdp libvncserver
pacman -Syu chromium opera 

pacman -Syu vlc digikam darktable kodi electrum 
# for iPhone USB tethering
pacman -Syu usbmuxd libimobiledevice

pacman -Rs mousepad

systemctl enable libvirtd
systemctl start libvirtd
systemctl enable chronyd
systemctl start chronyd


/etc/modprobe.d/nobeep.conf
# Do not load the 'pcspkr' module on boot.
blacklist pcspkr

xdg-mime query default application/pdf          
xdg-mime default zathura.desktop application/pdf



~/.ssh/config
Host *
StrictHostKeyChecking no
preferredauthentications=publickey,password

cat /etc/NetworkManager/NetworkManager.conf
[main]
dns=dnsmasq


#TODO:
$HOME/.ssh/config
$HOME/.config/remmina
.local/share/remmina
.config/tmuxinator/
/etc/systemd/system/monitor_hotplug.service


git config --global icdiff.options '--highlight --line-numbers'


git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syu --afterclean --answeredit None spotify  autorandr  networkmanager-dmenu-git pacolog icdiff vivaldi-snapshot rofi-calc todotxt-machine-git python-git-remote-dropbox-git
yay -Syu  #rapid-photo-downloader-bzr 
# vivaldi
# https://gist.github.com/BlackIkeEagle/5c00face3c7a0f98847a
gem install librarian-puppet
gem install rainbow terminal-notifier
#terminal-notifier it's macOS only
gem install tmuxinator

# Change application for "Open in terminal" context menu entry
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

#ansible
useradd -r -m  -G wheel ansible
su - ansible -c "ssh-keygen -t ed25519"


yay -Syu systemd-numlockontty
systemctl enable numLockOnTty
