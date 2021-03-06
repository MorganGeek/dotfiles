#!/usr/bin/env bash

# Install pa11y tool for local webpage accessibility analysis
echo "Installing pa11y tool for local webpage accessibility analysis"
npm install -g pa11y
echo "Installing moro, a productivity CLI tool"
npm install -g moro
echo "Install wiki CLI tool"
npm install -g wikit
echo "Install Write-good CLI spell checker"
npm install -g write-good
echo "Install Alex a text linter"
npm install -g alex

cd "$HOME" || exit
