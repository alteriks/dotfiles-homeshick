export QT_QPA_PLATFORMTHEME="qt5ct"
#export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
#export BROWSER=/usr/bin/palemoon
export TERMINAL=kitty

setxkbmap -option 'caps:escape'
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout pl 