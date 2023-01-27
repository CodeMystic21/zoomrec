#!/bin/bash
docker run -d --restart unless-stopped \
  -e TELEGRAM_BOT_TOKEN="mytoken" \
  -e TELEGRAM_CHAT_ID="mychatid" \
  -e TZ=Australia/Sydney \
  -e DISPLAY_NAME="Monica" \
  -e FFMPEG_INPUT_PARAMS="-hwaccel cuvid" \
  -e FFMPEG_OUTPUT_PARAMS="-c:v hevc_nvenc -gpu 0 -preset slow -acodec aac -b:a 128k" \
  -v /home/roger/zoomrec/recordings:/home/zoomrec/recordings \
  -v /home/roger/zoomrec/audio:/home/zoomrec/audio \
  -v /home/roger/zoomrec/meetings.csv:/home/zoomrec/meetings.csv:ro \
  -p 5901:5901 \
  --security-opt seccomp:unconfined \
  --gpus all \
  rkilchmn/zoomrec:latest
