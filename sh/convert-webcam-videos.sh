# convert files from .dav to .mp4 and group them by folder
for f in $(ls -d */);
do
    video_folder="$f";
    output_file="$PWD/${f::-1}.mp4"
    files=$(find $video_folder -type f -size +2000k -name "*.dav")

    ffmpeg -i "concat:${files//$'\n'/'|'}" -c copy $output_file
done

# extract audio from mp4 files
for f in $(find -name "*.mp4");
do
    video_file="$f";
    output_file="${f::-4}.m4a"
    ffmpeg -i $video_file -vn -acodec copy $output_file
done

# merge audio and video files
for f in $(find ../c/ -name "*.mp4");
do
    video_file="$f";
    file="${f::-4}"
    audio_file="${file//$'c'/'d'}.mp3"
    output_file="${f//$'c'/'e'}"

    # ffmpeg -i $video_file -i $audio_file -c:v copy -map 0:v:0 -map 1:a:0 $output_file
    ffmpeg -i $video_file -i $audio_file -vcodec copy -acodec copy -map 0:0 -map 1:0 $output_file
done

