# Qualia for managing dotfiles configuration
pacman -Syu python-pip
pip install mir.qualia

pacman -Syu i3blocks compton
pacman -Syu rsync bc acpi sysstat wget the_silver_searcher bind-tools tmux neovim zathura-pdf-mupdf 

pacman -Syu termite arandr rofi xclip feh lshw xsensors mtr xorg-xbacklight

pacman -Sy extra/networkmanager-openvpn easy-rsa

# vivaldi
# https://gist.github.com/BlackIkeEagle/5c00face3c7a0f98847a
pacman -Syu vivaldi  libva-intel-driver libva-mesa-driver
git clone https://aur.archlinux.org/vivaldi-snapshot.git
cd vivaldi-snapshot
makepkg -si


pacman -Syu qemu dmidecode bridge-utils icedtea-web jre8-openjdk virt-manager spotify mc vlc unace unarj unrar zip chromium electrum opera virt-viewer wireshark-gtk libreoffice-still 
pacman -Syu keepassx2 remmina rdesktop freerdp

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

git clone https://aur.archlinux.org/vivaldi.git
cd vivaldi
makepkg -si
cd ..
git clone https://aur.archlinux.org/hipchat.git
cd hipchat
makepkg -si

git clone https://aur.archlinux.org/gcal.git
cd gcal
makepkg -si

git clone https://aur.archlinux.org/todotxt.git
cd todotxt
makepkg -si
