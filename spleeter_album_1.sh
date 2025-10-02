#!/bin/bash
ALBUM_DIR="/home/abner/Music/charm-wav/charm"

mkdir -p "$ALBUM_DIR/output"

for f in "$ALBUM_DIR"/*.wav; do
  [ -e "$f" ] || continue

  echo "Processing: $f"  

  docker run --rm -v "$ALBUM_DIR":/input -v "$ALBUM_DIR"/output:/output deezer/spleeter:3.6-2stems separate -p spleeter:2stems -o /output -- "/input/$(basename "$f")"
done
