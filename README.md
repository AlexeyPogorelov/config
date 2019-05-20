# my config for Linux

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
turn on second display `xrandr --output eDP1 --auto --output DP1 --auto --left-of eDP1`
turn off second display `xrandr --output DP1 --off`

