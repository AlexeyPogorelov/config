# rm -r compressed
# mkdir compressed
# cp *.png ./compressed/
# cd compressed
# mogrify -resize 650x365 -format jpg *.png
# rm *.png
# find -type f -iname "*.jpg" -exec jpegoptim --strip-all --all-progressive -pm25 {} \;

# Look in the public/ directory
find public/ \
# Ignore directories called "static" regardless of location
-not -path "*/static/*" \
# Print the file paths of all files ending with any of these extensions
\( -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \) -print0 \
# Pipe the file paths to xargs and use 8 parallel workers to process 2 arguments
| xargs -0 -P8 -n2 \
# Tell mogrify to strip metadata, and...
mogrify -strip \
# ...compress and resize any images larger than the target size (1000px in either dimension)
-thumbnail '1000>' \
# Convert the files to jpg format
-format jpg
