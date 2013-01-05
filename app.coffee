###
Usage:
Given a folder of files, will sort them into subfolders
(according to the creation date)
###

args = require('argparser').arglen(1).parse()
path = require 'path'
fs = require 'fs'
mv = require 'mv'

main = {}

main.start = ->
	main.workingDir = args.arg(0) ? ""
	fs.readdir main.workingDir, main.dirWorkingDir

main.dirWorkingDir = (err, files) ->
	if err?
		throw err
	main.processFile(file) for file in files

main.processFile = (file) ->
	fullFilePath = path.join main.workingDir, file
	fileStat = fs.statSync fullFilePath
	if fileStat.isFile()
		cDayString = "#{fileStat.ctime.getFullYear()}_#{fileStat.ctime.getMonth()+1}_#{fileStat.ctime.getDay()}"
		cDayFullPath = path.join main.workingDir, cDayString
		cDayFullFilePath = path.join cDayFullPath, file
		unless fs.existsSync cDayFullPath
			fs.mkdirSync cDayFullPath
		mv fullFilePath, cDayFullFilePath, (err) ->
			if err?
				throw err

#Entry point
main.start()

