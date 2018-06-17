# Qualia for managing dotfiles configuration
pacman -Syu python-pip ruby icedtea-web jre8-openjdk python-urwid
pip install mir.qualia undervolt s-tui

pacman -Syu i3blocks compton termite arandr rofi xclip feh xorg-xbacklight tmux neovim zathura-pdf-mupdf xss-lock
pacman -Syu rsync bc acpi sysstat wget the_silver_searcher bind-tools net-tools pkgfile mc unace unarj unrar zip i7z jq
pacman -Syu dmidecode lshw xsensors mtr strace usleep
pacman -Syu bridge-utils extra/networkmanager-openvpn easy-rsa dnsmasq wireshark-gtk 
pacman -Syu qemu virt-manager virt-viewer vagrant
pacman -Syu libreoffice-still 
pacman -Syu keepassx2 keepassxc tigervnc remmina rdesktop freerdp libvncserver
pacman -Syu chromium opera 

pacman -Syu vlc digikam darktable kodi electrum  rapid-photo-downloader-bzr
# for iPhone USB tethering
pacman -Syu usbmuxd libimobiledevice

[root@revenge ~]# cat /etc/systemd/system/powertop.service
[Unit]
Description=Powertop tunings

[Service]
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
[root@revenge ~]# systemctl daemon-reload
[root@revenge ~]# systemctl status powertop
● powertop.service - Powertop tunings
   Loaded: loaded (/etc/systemd/system/powertop.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
[root@revenge ~]# systemctl enable powertop
Created symlink /etc/systemd/system/multi-user.target.wants/powertop.service → /etc/systemd/system/powertop.service.
[root@revenge ~]# systemctl start powertop

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
yay -Syu --afterclean --answeredit None spotify i3lock-color-git autorandr rapid-photo-downloader networkmanager-dmenu-git pacolog icdiff vivaldi-snapshot rofi-calc todotxt-machine-git
# vivaldi
# https://gist.github.com/BlackIkeEagle/5c00face3c7a0f98847a
gem install librarian-puppet
gem install rainbow terminal-notifier
#terminal-notifier it's macOS only
gem install tmuxinator
