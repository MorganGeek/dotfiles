#!/usr/bin/env bash
case "$(uname -s)" in
    Linux)
        echo '(Linux) Installing ruby'
        curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
        curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
        curl -L get.rvm.io | bash -s stable
        source /etc/profile.d/rvm.sh
        rvm reload
        rvm requirements run
        rvm install 2.3.7
        ;;
esac
