#!/usr/bin/env bash

# Install HomeBrew
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) installing homebrew"
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        # Prevent `Error: Your Homebrew is outdated. Please run `brew update`.`
        echo "Updating Homebrew"
        brew update
        ;;
esac
