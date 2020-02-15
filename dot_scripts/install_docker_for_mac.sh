#!/usr/bin/env bash
docker_app=$(find /Applications/ \
	-name "Docker.app" -maxdepth 1 -mindepth 1 -type d)
if [ -z "$docker_app" ]; then
	echo 'Install Docker Desktop for Mac OS X'
	curl -o ~/Downloads/Docker.dmg -sL https://download.docker.com/mac/stable/Docker.dmg
	hdiutil verify ~/Downloads/Docker.dmg
	hdiutil attach ~/Downloads/Docker.dmg -nobrowse
	cp -R /Volumes/Docker/Docker.app /Applications/
	hdiutil detach /Volumes/Docker
	rm ~/Downloads/Docker.dmg
	sudo /Applications/Docker.app/Contents/MacOS/Docker --quit-after-install --unattended
fi
