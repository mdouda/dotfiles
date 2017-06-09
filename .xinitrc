# TOUCHPAD SETTINGS #
TOUCHPAD=$(xinput | grep TouchPad | awk '{ print $6 }' | cut -d'=' -f2)
xinput --set-prop $TOUCHPAD "libinput Tapping Enabled" 1 &
# BITMAP FONTS #
xset fp+ /usr/share/fonts/local 
xset fp rehash 
# FUCKING STUPID BEEP #
xset b off &
xset b 0 0 0 &
# WM SETTINGS #
nm-applet &
compton &
mpd &
feh --bg-center ~/Pictures/Wallpapers/wp65.jpg &
/home/zem/Programming/scripts/statusbar.sh &
exec dwm
