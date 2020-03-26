### WiFi
turn on wifi `nmcli r wifi on`
get list of wifi networks `nmcli d wifi list`
connect to network `nmcli d wifi connect <ssid> password <password>`

### BlueTooth
get to internal comand prompt `bluetoothctl`
some usteful commands `power on`, `agent on`, `default-agent`, `scan on`, `scan off`
pait new device `pair <id>`
connect paired device `connect <id>`

### Multiple displays
move workspace to external display `i3 move workspace to right`

### Audio
get list of available outputs `pacmd list-sources | grep -e device.string -e 'name:'`
set default audio output `echo 'set-default-source bluez_sink.00_42_79_B5_9B_A8.a2dp_sink.monitor' | pacmd`

### FTP
start ftp server `sudo service vsftpd start`
stop ftp server `sudo service vsftpd stop`

### files
get folders sizes `du -h --max-depth=1 | sort -hr`
run sh script for all files in the folder `find . -iname '*.mp4' -exec sh ~/.config/sh/videoProcess.sh "{}" \`
or `for file in *.jpg; do ffmpeg -i "$file" -vf scale=iw*.5:-1 "${file%.jpg}"_out.jpg ; done`
unzip gz `tar -xvzf {{file}}`

### curl
help `curl cheat.sh`
my IP `curl ifconfig.co` or `curl wgetip.com`
weather `curl wttr.in`
share file `curl --upload-file [file] https://transfer.sh/[name]`
generate QR code `curl qrenco.de/this`

### tmux change root folder
`Ctrl`+`b` `:`
`attach -c ~/projects`

### reload DPI config without restart
set form comand line `xrdb -merge <(echo "Xft.dpi: 96")`
load from file `xrdb ~/.Xresources`

### compress images
png lossy `cp *.png ./compressed/ && find ./compressed -iname "*.png" -exec pngquant --quality=35-80 --skip-if-larger -s1 --ext=.png --force {} +`
png lossless `optipng -preserve -dir compressed/ -o7 -zm1-9 *.png`
jpeg `jpegoptim -d ./compressed/ -m 80 -T 10% -P *.jpg`
svg `cp *.svg compressed/ && svgo -r compressed/ -p 2 --multipass`

### ffmpeg
get video from images `ffmpeg -framerate 24 -pattern_type glob -i '*.png' -i {{input}}.wav -acodec aac -b:a 192k -shortest -c:v libx264 -r 24 -pix_fmt yuv420p {{output}}.mp4`
convert wav to mp3 `ffmpeg -i {{input}}.wav -vn -ar 44100 -ac 2 -b:a 320k {{output}}.mp3`
replace audio in video `ffmpeg -i {{input}}.mp4 -i {{input}}.wav -c:v copy -map 0:v:0 -map 1:a:0 -shortest {{output}}.mp4`
split part of the video 1 `ffmpeg -ss 10 -t 40 -i {{input}} -vcodec copy -acodec copy {{output}}`
split part of the video 2 `ffmpeg -i {{input}} -ss 00:00:02 -t 00:00:04 -async 1 {{output}}`
capture screen video `ffmpeg -video_size 1920x1080 -f x11grab -i :0.0+100,200 -framerate 25 {{output}}.mp4`
capture screen image `ffmpeg -video_size 1920x1080 -f x11grab -i :0.0+100,200 -framerate 1 -vframes 1 {{output}}.jpg`
video to GIF `ffmpeg -ss 00:00:06 -t 00:00:31 -i {{input}} -f gif -filter_complex "[0:v] fps=12,scale=w=480:h=-1,split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1" {{output}}.gif`
convert to VP9 `ffmpeg -i {{input}} -vf scale=1280:720 -c:v libvpx-vp9 -b:v 600K -b:a 128k -ac 1 -c:a libopus -cpu-used 0 -threads 8 {{output}}.webm`
apply 3dlut to video `ffmpeg -i {{input}} -vf lut3d="file=<apsolute file path>" -c:a copy -threads 1 -s 1280x720 {{output}}`
slowdown 4 times to target 30 fps `ffmpeg -i {{input}} -vf setpts=4*PTS -r 30 {{output}}`
scale to ratio 2.4x1 `ffmpeg -i {{input}} -vf "scale=1920x800,setsar=1:1" {{output}}`
half the size of the picture `ffmpeg -i {{input}} -vf "scale=iw*.5:ih*.5" {{output}}`

### show opened ports
show all `sudo lsof -i`

### Docker
run image `docker run -v $PWD:/temp/ -it --entrypoint='bash' jrottenberg/ffmpeg`
start VSCode server `docker run -it -p 8080:8080 -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server" -v "$PWD:/home/coder/project" codercom/code-server:v2`

### SCP
download `scp username@host:{{input}} /directory`
upload `scp {{input}} username@host:/directory`
upload directory `scp -r {{local_directory}} username@host:/remote_directory`

### fun
watch star wars `telnet towel.blinkenlights.nl`

