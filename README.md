[![build status](https://secure.travis-ci.org/gaving/flute.png)](http://travis-ci.org/gaving/flute)

# Flute

Bored of silent pipelines? Want to *hear* when somethings working?

Meet *flute*.

## Screencast

[Here's a screencast.](https://vimeo.com/39440084)

## Install

    npm install flute -g

    ♬♩♩♬♩ flute ♬♩♬♩♩♬
    Usage: flute [arg]

    Options:
    -t, --track    use specified track
    -l, --library  use tracks from config ~/.flute.yml
    -s, --seek     seek to hh:mm:ss (used with -t; requires mplayer)

## Configuration

Flute passed with no arguments plays a rubbish default flute sound. However,
this can be changed to a list of tracks by specifying them in a config file
with the following steps:-

- Create a ~/.flute.yml file
- Populate it with the absolute path of your files ('tracks:' at the top is important):-

        tracks:
          - ~/Music/Lana Del Rey/Born to Die/06 National Anthem.m4a
          - ~/Music/Compilations/Final Fantasy  VII/1-07 Hurry!.m4a
          - ~/Music/Compilations/Final Fantasy  VII/4-08 Hurry Faster!.m4a

Pass the -l argument to flute and it will pick one of these at random.
Optionally, pass -t with an argument file location to play that certain track.

## Examples

Inject flute into your pipeline wherever you would in place of cat:-

     pv -L 5k ~/Desktop/eI3s-dvZysU.flv | flute > /dev/null

     youtube-dl http://www.youtube.com/watch?v=azOWjmfUqVw -o - | flute > harris.flv

     dd if=/dev/urandom | pv -L 10M | flute -l > /dev/null

     flute -t yeah.mp3 -s 1:40 | while true; do ( seq 0 100 | sort -R | spark | lolcat -a ); done;
