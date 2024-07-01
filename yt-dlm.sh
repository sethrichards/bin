!#/bin/bash
# Download a youtube playlist as audio files

playlist=$1

echo $playlist
yt-dlp -x --embed-metadata -o "%(playlist_index)s - %(artist)s - %(track)s [%(id)s].%(ext)s"  "$1"
