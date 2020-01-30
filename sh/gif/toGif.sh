ffmpeg -ss $1 -i ./test.mp4 -to $2 -f gif -filter_complex "[0:v] fps=12,scale=w=640:h=-1,split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1" -copyts ./test.gif

