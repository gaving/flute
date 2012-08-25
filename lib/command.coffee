#!/usr/bin/env node

flute = require './flute'
optimist = require('optimist')
argv = optimist
  .usage('♬♬♩♩♬♩ flute ♬♩♬♩♩♬\nUsage: $0 [arg]')
  .alias('t', 'track')
  .alias('l', 'library')
  .alias('s', 'seek')
  .describe('t', 'use specified track')
  .describe('l', 'use tracks from config ~/.flute.yml')
  .describe('s', 'seek to hh:mm:ss (used with -t; mplayer only)')
  .argv

if (optimist.argv.h) or (optimist.argv.help)
  optimist.showHelp()
  process.exit 0

exports.run = ->
  flute.useLibrary(true) if argv.l
  flute.useTrack(argv.t, argv.s if argv.s) if argv.t
  flute.process(process.stdin)

# vim:ft=coffee ts=2 sw=2 et :
