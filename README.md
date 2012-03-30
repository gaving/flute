# Flute

Are you bored of silent pipelines? Want to *hear* when something's working?

Meet *flute*.

## Screencast

[Here's a screencast.](https://vimeo.com/39440084)

## Install

    npm install flute -g

    ♬♩ Musical pipeline ♬♩
    Usage: flute [args]

    Options:
      -t, --tracks  use tracks from config ~/.flute.yml

## Configure

Flute passed with no arguments plays a rubbish flute sound. However, this can
easily be changed to a list of tracks by specifying them in a config file with
the following steps:-

- Create a ~/.flute.yml file
- Create a file with the absolute path of your files (tracks: at the top is important):-

    tracks: 
      - /Volumes/WD/Music/iTunes/iTunes Music/Music/Lana Del Rey/Born to Die/06 National Anthem.m4a
      - /Volumes/WD/Music/iTunes/iTunes Music/Music/Compilations/Final Fantasy  VII/1-07 Hurry!.m4a
      - /Volumes/WD/Music/iTunes/iTunes Music/Music/Compilations/Final Fantasy  VII/4-08 Hurry Faster!.m4a

Pass the -t argument to flute and it will pick one of these at random.

## Examples

Inject flute into your pipeline wherever:-

     pv -L 5k ~/Desktop/eI3s-dvZysU.flv | flute > /dev/null

     youtube-dl http://www.youtube.com/watch?v=azOWjmfUqVw -o - | flute > harris.flv

     dd if=/dev/urandom | pv -L 10M | flute -t > k

## Note

Flute has only been tested on OSX.

