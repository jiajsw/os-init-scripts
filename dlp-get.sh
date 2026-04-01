#!/bin/bash

yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" \
--merge-output-format mp4 \
--proxy socks5://127.0.0.1:8888 \
--js-runtimes node \
--cookies ./www.youtube.com_cookies.txt \
"$@"