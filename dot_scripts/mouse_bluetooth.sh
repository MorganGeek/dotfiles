#!/usr/bin/env bash
scriptfile=./connectmouse.applescript
parentdir=$(dirname -- "$0")
osascript "${parentdir}/${scriptfile}"
