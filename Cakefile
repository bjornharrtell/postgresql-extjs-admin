fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'


build = (callback) ->
  coffee = spawn 'coffee', ['-c', '-o', 'app', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0


task 'build', 'Build app/ from src/', ->
  build()


task 'watch', 'Watch src/ for changes', ->
  console.log "Starting CoffeeScript compiler (watching for changes in /src folder)..."
  coffee = spawn 'coffee', ['-w', '-c', '-o', 'app', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()  
