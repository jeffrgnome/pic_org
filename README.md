pic_org
=======

A node.js utility for organizing files into subfolders according to the creation date. I plan to use this for dumping a bunch of images off a camera, and quickly organizing them.

How to run:
1) git clone https://github.com/jeffrgnome/pic_org.git
2) cake build
3) node app.js /path/to/pictures

Example of how a folder changes:
pictures (before)
	IMG_123.jpg
	IMG_456.jpg
	...

pictures (after)
	2013_01_05
		IMG_123.jpg
		...
	2013_01_14
		IMG_456.jpg
		...
	...

