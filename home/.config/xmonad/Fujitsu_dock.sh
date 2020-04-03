#!/bin/sh
# wait for the dock state to change
sleep 0.5
DOCKED=$(cat /sys/devices/platform/dock.1/docked)
case "$DOCKED" in
	"0")
       #undocked event - lets remove all connected outputs apart from LVDS
	logger "XRANDR UNDOCK"
	su - dajka_krzy_ext -c "DISPLAY=:0 xrandr --output DP2 --off --output HDMI1 --off --output HDMI3 --off --output eDP1 --auto"
	;;
	"1")
	#docked event - sample will created extended desktop with DVI1 to the right of LVDS1
	#/usr/bin/xrandr -d :0.0 --output DVI1 --right-of LVDS1 --auto
	logger "XRANDR DOCK"
	su - dajka_krzy_ext -c "DISPLAY=:0 xrandr --output HDMI1 --primary --auto --nograb --output HDMI3 --off --output DP2 --off --output eDP1 --off"
	#sleep 1
	su - dajka_krzy_ext -c "DISPLAY=:0 xrandr --output HDMI1 --primary --auto --output DP2 --auto --right-of HDMI1 --output HDMI3 --auto --right-of DP2 --output eDP1 --off --nograb"
	su - dajka_krzy_ext -c "DISPLAY=:0 xrandr --output HDMI1 --rotate left --output DP2 --rotate left --output HDMI3 --rotate left"
	;;
esac
exit 0
