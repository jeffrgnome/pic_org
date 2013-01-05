fs = require 'fs'

{print} = require 'sys'
{spawn, exec} = require 'child_process'


build = (watch) ->
	###
	coffeelib = spawn 'coffee', ['-c', '-o', 'lib', 'src']
	coffeelib.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	coffeelib.stdout.on 'data', (data) ->
		print data.toString()
	coffeelib.on 'exit', (code) ->
		watch?() if code is 0
	###

	coffeeapp = spawn 'coffee', ['-c', 'app.coffee']
	coffeeapp.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	coffeeapp.stdout.on 'data', (data) ->
		print data.toString()
	coffeeapp.on 'exit', (code) ->
		watch?() if code is 0

coffee_callback = ->
	print '========== END compile ==========\n'

task 'build', 'build n watch, src->lib, and app.coffee->app.js', ->
	build(coffee_callback)

