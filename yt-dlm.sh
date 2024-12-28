!#/bin/bash
# Download a youtube playlist as audio files with nice title formatting & metadata

playlist=$1

args=(
    # Only keep the audio
    --extract-audio

    --audio-format=best

    # Youtube doesn't fill out the track number reliably, so invent it from the playlist
    --parse-metadata "%(playlist_index)s:%(meta_track)s"

    # yt-dlp fills the date with upload date, we care about original release date
    --parse-metadata "%(release_year)s:%(meta_date)s"

    # Embed metadata & thumbnnails
    --embed-metadata
    --embed-thumbnail

    # Crop thumbnail to square - from https://github.com/yt-dlp/yt-dlp/issues/429#issuecomment-1519029825
    --ppa "ThumbnailsConvertor+FFmpeg_o:-c:v mjpeg -vf crop=\"'if(gt(ih,iw),iw,ih)':'if(gt(iw,ih),ih,iw)'\""

    # Format the title to make Plex happy
    -o "%(artist)s - %(album)s/%(playlist_index)s - %(artist)s - %(track)s [%(id)s].%(ext)s"
)

yt-dlp "${args[@]}" "${playlist}"
