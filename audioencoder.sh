#!/bin/bash

# filename=$1
# new_filename=${filename%.*}.mp3
# ffmpeg -i $filename -c:a libmp3lame -b:a 320k $new_filename
# echo "Success"

for file in *.wav; do
  # 확장자를 mp3로 변경합니다.
  new_filename=${file%.*}.mp3
  # 새 파일을 생성합니다.
  ffmpeg -i "$file" -c:a libmp3lame -b:a 320k "$new_filename" &
done

echo "wav to mp3 in background......."
wait
rm *.wav
echo "All wav files have been converted to mp3! and deleted all wav files"
