.PHONY: all clean

all: watch

install:
	npm install
	node ./node_modules/electron/install.js

build:
	./node_modules/.bin/webpack

start:
	./node_modules/.bin/electron forge.js

clean:
	rm -rf node_modules
	rm -rf elm-stuff

watch:
	./node_modules/.bin/webpack --config webpack.config.js --watch &
	./node_modules/.bin/electron forge.js
	killall node
