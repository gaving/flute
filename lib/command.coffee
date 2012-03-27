#!/usr/bin/env node

flute = require './flute'
argv = require('optimist')
  .usage('♬♩ Musical pipeline ♬♩\nUsage: $0 [query]')
  .alias('t', 'tracks')
  .describe('t', 'use tracks from config ~/.flute.yml')
  .argv

exports.run = ->
  flute.library() if argv.t
  flute.process(process.stdin)

# vim:ft=coffee ts=2 sw=2 et :
