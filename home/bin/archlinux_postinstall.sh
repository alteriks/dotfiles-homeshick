# Qualia for managing dotfiles configuration
pacman -Syu python-pip
pip install mir.qualia

pacman -Syu i3blocks bc acpi sysstat wget
pacman -Syu termite arandr rofi xclip feh lshw xsensors

pacman -Sy extra/networkmanager-openvpn easy-rsa


pacman -Syu qemu dmidecode bridge-utils icedtea-web jre8-openjdk virt-manager spotify mc vlc unace unarj unrar zip chromium electrum opera virt-viewer wireshark-gtk libreoffice-still 
pacman -Syu keepassx2

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
