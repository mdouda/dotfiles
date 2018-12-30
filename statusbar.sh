# Colour codes from dwm/config.h
redColor="\x05"
regularColor="\x01"

separator_edge() {
    echo -ne "${redColor} |||${rpmColor}"    
}

sep() {
    echo -ne "${redColor}...${rpmColor}"    
}

print_song_info() {
  track="$(mpc current)"
  artist="${track%%- *}"
  title="${track##*- }"
  [[ -n "$artist" ]] && echo -e "${regularColor}ê ${color5}${artist}- ${color9}${title} ${color0}$(sep)"
}

print_mem() {
    used_mem="$(free -m | awk '/Mem/ { print ($3/$2)*100 }')"
    echo -ne "${regularColor}Î ${used_mem}%"
}

print_hddfree() {
  hddfree="$(df -Ph /dev/sda2 | awk '$3 ~ /[0-9]+/ {print $4}')"
  echo -ne "${regularColor}¨ ${hddfree} - ROOT"
}

print_homefree() {
	hddfree="$(df -Ph /dev/sdb1 | awk '$3 ~ /[0-9]+/ {print $4}')"
	echo -ne "${regularColor}¨ ${hddfree} - HOME"
}

print_power() {
  status="$(cat /sys/class/power_supply/ACAD/online)"
  battery="$(cat /sys/class/power_supply/BAT1/capacity)"
  timer="$(acpi -b | grep "Battery" | awk '{print $5}' | cut -c 1-5)"
  if [ "${status}" == 1 ]; then
    echo -ne "${regularColor}Â ON ${battery}"
  else
    echo -ne "${regularColor}ð ${battery}% ${timer}"
  fi
}

print_datetime() {
  datetime="$(date "+%a %d %b %I:%M")"
  echo -ne "${regularColor}È ${datetime}"
}

print_volume() {
  volume="$(amixer | grep 'Left: Playback' | cut -d' ' -f 7,8 | tr -d [])"
  echo -ne "${regularColor}í ${volume}"
}

while true; do
    DWM_STATUS="$(separator_edge)$(print_song_info) $(print_volume) $(sep) $(print_hddfree) $(sep) $(print_homefree) $(sep) $(print_mem) $(sep) $(print_datetime) $(sep) $(print_power) $(separator_edge)"
xsetroot -name "$DWM_STATUS"
sleep 5
done 
