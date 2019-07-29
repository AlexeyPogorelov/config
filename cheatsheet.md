### get help
`curl cheat.sh`

### get weather
`curl wttr.in`

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

