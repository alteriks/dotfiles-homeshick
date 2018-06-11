# Qualia for managing dotfiles configuration
pacman -Syu python-pip ruby
pip install mir.qualia undervolt s-tui

pacman -Syu i3blocks compton
pacman -Syu rsync bc acpi sysstat wget the_silver_searcher bind-tools tmux neovim zathura-pdf-mupdf net-tools pkgfile

pacman -Syu termite arandr rofi xclip feh lshw xsensors mtr xorg-xbacklight strace ruby i7z jwhois usleep

#terminal-notifier it's macOS only

pacman -Sy extra/networkmanager-openvpn easy-rsa

# vivaldi
# https://gist.github.com/BlackIkeEagle/5c00face3c7a0f98847a
pacman -Syu vivaldi  libva-intel-driver libva-mesa-driver
git clone https://aur.archlinux.org/vivaldi-snapshot.git
cd vivaldi-snapshot
makepkg -si


pacman -Syu qemu dmidecode bridge-utils icedtea-web jre8-openjdk virt-manager spotify mc vlc unace unarj unrar zip chromium electrum opera virt-viewer wireshark-gtk libreoffice-still dnsmasq
pacman -Syu keepassx2 keepassxc tigervnc remmina rdesktop freerdp

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

git clone https://aur.archlinux.org/dropbox.git
cd dropbox
makepkg -si

git clone https://aur.archlinux.org/i3lock-color-git.git
cd i3lock-color-git
makepkg -si


git clone https://aur.archlinux.org/autorandr.git
cd autorandr
makepkg -si

git clone https://aur.archlinux.org/networkmanager-dmenu-git.git
cd networkmanager-dmenu-git
makepkg -si

git clone https://aur.archlinux.org/pacolog.git
cd pacolog
makepkg -si

git clone https://aur.archlinux.org/pacman-lint.git
cd pacman-lint
makepkg -si

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


yaourt -Sb icdiff
git config --global icdiff.options '--highlight --line-numbers'


gem install librarian-puppet
gem install rainbow terminal-notifier
