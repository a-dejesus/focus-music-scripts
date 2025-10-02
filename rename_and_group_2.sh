#!/bin/bash

# Where Spleeter put your separated tracks
SOURCEDIR="/home/abner/Music/charm-wav/charm/output"

# Where you want all accompaniments collected
DESTDIR="$SOURCEDIR/all_accompaniments"
mkdir -p "$DESTDIR"

# Loop over each song folder
for trackdir in "$SOURCEDIR"/*; do
    # Make sure it's a directory
    [ -d "$trackdir" ] || continue

    # Grab the base name of the folder (original song filename without .mp3)
    trackname=$(basename "$trackdir")

    if [ -f "$trackdir/accompaniment.wav" ]; then
        cp "$trackdir/accompaniment.wav" "$DESTDIR/${trackname}_accompaniment.wav"
    fi
done

echo "Done! All accompaniments collected in: $DESTDIR"