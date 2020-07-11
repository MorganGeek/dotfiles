#!/usr/bin/env bash
# Install baton (CLI to manage Spotify playback) https://github.com/joshuathompson/baton
case "$(uname -s)" in
    Darwin)
        echo '(Mac OS X) Installing baton (Spotify CLI)'
        curl -sSL https://github.com/joshuathompson/baton/releases/download/0.1.7/baton-0.1.7-darwin-amd64 -o /usr/local/bin/baton && chmod +x /usr/local/bin/baton
        ;;

    Linux)
        echo '(Linux) Installing baton (Spotify CLI)'
        curl -sSL https://github.com/joshuathompson/baton/releases/download/0.1.7/baton-0.1.7-linux-amd64 -o /usr/local/bin/baton && chmod +x /usr/local/bin/baton
        ;;
    *)
        echo 'Non supported OS : Installation aborted for baton (Spotify CLI)'
        exit
        ;;
esac
