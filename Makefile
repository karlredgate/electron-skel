
default: app

app: Skel.app/Contents/MacOS/Electron
app: Skel.app/Contents/Resources/app/package.json
app: Skel.app/Contents/Resources/app/index.js
app: Skel.app/Contents/Resources/app/index.html

Skel.app/Contents/Resources/app/%: %
	mkdir -p Skel.app/Contents/Resources/app
	cp $< $@

Skel.app/Contents/MacOS/Electron: node_modules/electron/dist/Electron.app/Contents/MacOS/Electron
	mkdir Skel.app
	( cd node_modules/electron/dist/Electron.app ; tar cf - . ) | ( cd Skel.app ; tar xvf - )
	cp Info.plist Skel.app/Contents/Info.plist

node_modules/electron/dist/Electron.app/Contents/MacOS/Electron:
	npm install electron

clean:
	rm -rf Skel.app node_modules
