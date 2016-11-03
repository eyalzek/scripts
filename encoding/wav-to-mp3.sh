#!/bin/bash
for i in *.wav; do ffmpeg -i "$i" -vn -ar 44100 -ac 2 -ab 320k -f mp3 "${i/wav/mp3}";done

