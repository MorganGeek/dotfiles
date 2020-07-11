#!/usr/bin/env bash
# Install pip and pipenv
echo "Installing pip and pipenv"
sudo easy_install pip
sudo pip install --upgrade pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py
case "$(uname -s)" in
    Darwin)
        echo "(Mac OS X) Updating PATH for loading pip user installed packages"
        ln -snf /usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/bin/pip pip3
        export PATH="$PATH:/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/bin/:/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/bin:/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/bin"
        ;;
esac
echo "Upgrading pip"
sudo pip install --upgrade pip
echo "Pip installing stuff"
pip install -r requirements.txt

# was used for some slack CLI in python... https://pypi.org/project/slack-cli/
# pip3 install pipenv
# pyenv install 3.6.0

git clone https://github.com/sherlock-project/sherlock.git ~/Code/sherlock
cd sherlock || exit
python3 -m pip install -r requirements.txt
