#!/usr/bin/env node

sys    = require 'util'
path   = require 'path'
_      = require 'underscore'
fs     = require 'fs'
play   = require('play').Play()

class Flute
  constructor: ->
    @lib = false
  useLibrary: (library) ->
    @lib = library
  useTrack: (track, skip) ->
    @track = track
    @skip = skip
  config: (cb) ->
    fs.readFile path.join(process.env.HOME, '.flute.yml'), (err, text) ->
      throw err if err
      cb require('yaml').eval(text.toString())
  play: (cb) ->
    if @lib
      @config (config) ->
        cb play.sound _.first(_.shuffle(config.tracks))
    else
      if @track
        path = @track
      else
        path = path.join(__dirname, '../data/flute.mp3')
      if @skip
        cb play.sound path, ['-ss', @skip]
      else
        cb play.sound path
  process: (fd) ->
    @play (snd) ->
      fd.resume()
      fd.setEncoding 'binary'
      fd.on 'data', (chunk) ->
        process.stdout.write(chunk, 'binary')
      fd.on 'close', () ->
        snd.kill()
        process.exit 0

module.exports = new Flute
