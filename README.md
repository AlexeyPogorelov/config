# My config for Linux

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

### Reload TouchPad to fix issue for Surface Laptop
`sudo watch -n 80 sh ~/.config/resetTouchpad.sh`

### Audio
get list of available outputs `pacmd list-sources | grep -e device.string -e 'name:'`
set default audio output `echo 'set-default-source bluez_sink.00_42_79_B5_9B_A8.a2dp_sink.monitor' | pacmd`

