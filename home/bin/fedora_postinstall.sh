dnf install -y zsh git tmux screen atop htop util-linux-user
dnf copr enable -y  yaroslav/i3desktop
dnf install -y i3 i3status rofi
dnf install -y xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xauth
dnf install -y firefox
dnf install -y keepassx

chsh -s /bin/zsh alteriks

cat <<EOF >> /etc/yum.repos.d/hipchat.repo
[atlassian-hipchat]me=Atlassian Hipchat
name=Atlassian Hipchat
baseurl=https://atlassian.artifactoryonline.com/atlassian/hipchat-yum-client/
enabled=1
gpgcheck=0
EOF

dnf install -y hipchat4
