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

# MPD
if [[ -z $(ps -A | grep mpd) ]]
    then mpd &
fi

# WP & STATUS
feh --bg-scale ~/Pictures/wp1.jpg &
/home/zem/.stat.sh &

#GO
exec dwm 
