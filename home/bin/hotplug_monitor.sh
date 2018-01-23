#!/bin/bash

X_USER=alteriks
export DISPLAY=:0
export XAUTHORITY=/home/$X_USER/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u ${X_USER})/bus

function connect()
{   
#
/usr/bin/autorandr off
  sleep 1
/usr/bin/autorandr -c --force
#xrandr --output VIRTUAL1 --off --output DP1 --mode 3440x1440 --pos 1366x0 --rotate normal --output eDP1 --primary --mode 1366x768 --pos 0x672 --rotate normal --output DP3 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --output DP2 --off

    #dual monitor - HDMI1 at right - xfce panel on left (LVDS1)
    #xrandr --output HDMI1 --right-of LVDS1 --preferred  --output HDMI1 --primary >> /tmp/screen

    #Set xfce panel on primary monitor
    #xfconf-query -v -c xfce4-panel -p /panels/panel-0/output-name -s HDMI1 
}

function disconnect(){
#/usr/bin/autorandr -l laptop
/home/alteriks/.screenlayout/laptop.sh
     #xrandr --output HDMI1 --off
     #Set xfce panel on LVDS1
     #xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s LVDS1
}

#if [ $(cat /sys/class/drm/card0-DP-1/status) == "connected" ] ; then
if [ $(cat /sys/class/drm/card0-{DP,HDMI,VGA}*/status | grep -c '^connected') -ge 1 ] ; then
  DISPLAY_SETUP=`autorandr 2>&1 | grep detected | cut -f1 | awk '{print $1}'`
  if [[ ${DISPLAY_SETUP} =~ 'docked' ]]; then
    qualia ${DISPLAY_SETUP} < ~/.config/i3/config_orig > ~/.config/i3/config
    sleep 1
    i3-msg restart
  fi
  sleep 1
  connect
#  TODO: indent
#  TODO: qualia or i3-msg to move workspaces
#i3msg-reload

elif [ $(cat /sys/class/drm/card0-{DP,HDMI,VGA}*/status | grep -c '^connected') -eq 0 ] ; then
#elif [ $(cat /sys/class/drm/card0-DP-1/status) == "disconnected" ] ; then
	sleep 1
  disconnect
else 
  exit
fi
