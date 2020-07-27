ffmpeg -i ./in.mp4 -vsync 0 ./frames/%d.png
for file in ./frames/*.png; do darktable-cli "$file" ./in.xmp ./processed/"$file" ; done
ffmpeg -framerate 24 -pattern_type glob -i './processed/frames/*.png' -c:v libx264 -r 24 -pix_fmt yuv420p out.mp4

