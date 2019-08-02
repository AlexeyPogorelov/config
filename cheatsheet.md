### get help
`curl cheat.sh`

### WiFi
turn on wifi `nmcli r wifi on`
get list of wifi networks `nmcli d wifi list`
connect to network `nmcli d wifi connect <ssid> password <password>`

### BlueTooth
get to internal comand prompt `bluetoothctl`
some usteful commands `power on` `agent on` `default-agent` `scan on` `scan off`
pait new device `pair <id>`
connect paired device `connect <id>`

### Multiple displays
apply default settings `xrandr --auto`
turn on second display `xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1`
turn off second display `xrandr --output DP1 --off`
move workspace to external display `i3 move workspace to left`

### Audio
get list of available outputs `pacmd list-sources | grep -e device.string -e 'name:'`
set default audio output `echo 'set-default-source bluez_sink.00_42_79_B5_9B_A8.a2dp_sink.monitor' | pacmd`

### get weather
`curl wttr.in`

### generate QR code
`curl qrenco.de/this`

### tmux change root folder
`Ctrl`+`b` `:`
`attach -c ~/projects`

### reload DPI config without restart
set form comand line `xrdb -merge <(echo "Xft.dpi: 96")`
load from file `xrdb ~/.Xresources`

### great htop alternative
`glances`

### check network speed
check speed `speedtest-cli`
monitor speed `speedometer -r wlp2s0`

### convert video
convert to VP9 `ffmpeg -i input.mp4 -vf scale=1280:720 -c:v libvpx-vp9 -b:v 600K -b:a 128k -ac 1 -c:a libopus -cpu-used 0 -threads 8 output.webm`

### compress images
png lossy `cp *.png ./compressed/ && find ./compressed -iname "*.png" -exec pngquant --quality=35-80 --skip-if-larger -s1 --ext=.png --force {} +`
png lossless `optipng -preserve -dir compressed/ -o7 -zm1-9 *.png`
jpeg `jpegoptim -d ./compressed/ -m 80 -T 10% -P *.jpg`
svg `cp *.svg compressed/ && svgo -r compressed/ -p 2 --multipass`

### working with files
get folders sizes `du -hsc *`

