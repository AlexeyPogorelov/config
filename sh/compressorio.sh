#!/bin/bash

#curl -F 'files=@../../Pictures/bg.png' https://compressor.io/server/Lossy.php

#curl -F 'files[]=@../../Pictures/bg.png' -F 'files[]=@../../Pictures/bg_a.png' https://compressor.io/server/Lossy.php

for i in "$*"
do
  filesPath+="$i "
done

echo "$filesPath"

