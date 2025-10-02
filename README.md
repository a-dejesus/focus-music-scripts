# focus-music-scripts
Bash scripts to remove vocals from music folders, creating lyric-free focus tracks — personal tools for distraction-free work.

This project started from a simple need: I wanted to listen to music without lyrics while working. These bash scripts process a folder of music to produce instrumental-only tracks, helping me maintain focus.

Spleeter Album Separation Script

This repository contains a shell script to automatically separate MP3 tracks into stems (vocals and accompaniment) using Spleeter in Docker.

Quick Start

1. **Install Requirements**

  >Docker installed and running.
  >A folder containing the MP3 tracks you want to process.

2. **Pull the Spleeter Docker Image**

  >Run:
  >`docker pull deezer/spleeter:3.6-2stems`

3. **Configure the Script**

  >Open spleeter_album.sh and set the ALBUM_DIR variable to your folder path:
  >`ALBUM_DIR="/full/path/to/your/album"` 
  >The script will create an output folder in this directory for the separated stems.

4. **Run the Scripts**

  >Make them executable:
  >`chmod +x spleeter_album_1.sh`
  >`chmod +x rename_and_groupe_2.sh`
  >Then run:
  >`./spleeter_album_1.sh`
  >For each MP3 in your folder, the script will:
  >Print the file being processed.
  >Separate it into vocals and accompaniment using Spleeter in Docker.
  >Save the stems in the output folder.
  

5. **Output**
  
  >After running, your folder will look like:
  
  <pre> AlbumFolder/
  ├── 01 - Track1.mp3
  ├── 02 - Track2.mp3
  └── output/
      ├── 01 - Track1/
      │ ├── vocals.wav
      │ └── accompaniment.wav
      └── 02 - Track2/
        ├── vocals.wav
        └── accompaniment.wav </pre>
**Notes**
>The script handles spaces and special characters in filenames.
>To use a different stem model, change the -p argument in the script, e.g., -p spleeter:4stems.
        
6. **Run rename_and_group_2.sh**
  > Run
  > `./rename_and_groupe_2.sh`
  > This script automates gathering the accompaniment tracks from Spleeter’s output. For each song folder in the Spleeter output, it copies the accompaniment.wav file, renames it to match the original song’s name, and places all collected accompaniments into a single folder. This makes it easy to organize and access instrumentals without manually renaming or moving files.
