cask "java"
cask "iterm2"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
yum -y install https://zoom.us/client/latest/zoom_x86_64.rpm

# Install Development Tools
sudo yum group -y install "Development Tools"

# Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
## Update package cache
yum check-update
yum install dnf -y
dnf check-update
sudo dnf install -y code

# Enable EPEL repository
sudo yum -y install epel-release

# PGAdmin
yum -y install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm
yum -y install pgadmin4

# Network tools
yum -y install net-tools lsof iproute nmap
# Mindmap Editor
yum -y install https://www.xmind.net/xmind/downloads/XMind-ZEN-for-Linux-64bit.rpm 
# VideoLAN 
sudo yum -y install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
yum -y install vlc
# Install Spectacle
#sudo yum -y install snapd
#sudo systemctl enable --now snapd.socket
#sudo ln -s /var/lib/snapd/snap /snap
#sudo snap -y install spectacle

# Browser
yum -y install firefox

# Fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Install ZSH
sudo yum -y install zsh
curl https://raw.githubusercontent.com/git-ftp/git-ftp/master/git-ftp > /bin/git-ftp
# Install git-ftp
chmod 755 /bin/git-ftp

# Install Golang
yum install golang golang-godoc golang-vet golang-src golang-pkg-linux-amd64 -y
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH="$GOPATH/bin:$PATH"' >> ~/.zshrc
. ~/.zshrc

# Install Hugo
mkdir $HOME/src
cd $HOME/src
git clone https://github.com/gohugoio/hugo.git
cd hugo
go install --tags extended
cd $HOME

# Inet utils
yum -y install telnet ftp rsh traceroute
# FTP UI
yum -y install filezilla

# Install SDK Man
curl -s "https://get.sdkman.io" | bash
source "/root/.sdkman/bin/sdkman-init.sh"

# Install Plantuml
sdk install java
curl -L http://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /usr/local/bin/plantuml.jar && \
    echo 'java -jar /usr/local/bin/plantuml.jar $@' > /usr/local/bin/plantuml && \
    chmod +x /usr/local/bin/plantuml

# Using pyenv to be able to install specific python versions https://stackoverflow.com/questions/49794432/how-to-setup-a-pipenv-python-3-6-project-if-os-python-version-is-3-5
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
source ~/.zshrc
yum -y install git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel
# Install Python 3
pyenv install 3.7.3
pyenv global 3.7.3
ln -snf /root/.pyenv/versions/3.7.3/bin/python  /usr/bin/python3.7

# ripgrep
sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum -y install ripgrep

# chezmoi : dotfiles manager
curl -sfL https://git.io/chezmoi | sh && ln -snf "$(pwd)/bin/chezmoi" /usr/local/bin/chezmoi

yum -y install tmux
yum -y install nodejs

# Fasd (pronounced similar to "fast") is a command-line productivity booster. https://github.com/clvv/fasd
sudo yum -y install fasd

# Simplistic interactive filtering tool https://github.com/peco/peco
go get github.com/peco/peco/cmd/peco

# Tig is an ncurses-based text-mode interface for git.
yum -y install tig

pip install mackup

# Lynx is a fully featured World-Wide Web browser for terminal users. https://invisible-island.net/lynx/
yum -y install lynx
yum -y install colordiff
# Proxy server that works as a poor man's VPN
yum -y install sshuttle
yum -y install ansible

# Prepare lsd install
yum -y install cargo
# Next gen ls command https://github.com/Peltoche/lsd
cargo install lsd
echo 'export PATH="/root/.cargo/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Prepare swipl install
yum -y install epel-release
yum groupinstall -y "Development Tools"
yum -y install ninja-build   libunwind   freetype-devel   gmp-devel   java-1.8.0-openjdk-devel   jpackage-utils   libICE-devel   libjpeg-turbo-devel   libSM-devel   libX11-devel   libXaw-devel   libXext-devel   libXft-devel   libXinerama-devel   libXmu-devel   libXpm-devel   libXrender-devel   libXt-devel   ncurses-devel   openssl-devel   pkgconfig   readline-devel   libedit-devel   unixODBC-devel   zlib-devel   uuid-devel   libarchive-devel   libyaml-devel

## Prepare cmake3 install
#pyenv install 3.6.0
#ln -snf /root/.pyenv/versions/3.6.0/bin/python  /usr/bin/python3.6
#yum -y install python36 # because pyenv installs python in a way that do not help installing cmake3

yum -y install cmake3 && ln -snf /usr/bin/cmake3 /usr/bin/cmake
git clone --depth 1 https://github.com/SWI-Prolog/swipl.git && cd swipl && git submodule update --init && mkdir build && cd build

cmake3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja ..
ninja-build install
# Now SWI-Prolog is ready, let's install logtalk
yum -y install https://logtalk.org/files/logtalk-3.28.0-1.noarch.rpm
# Logtalk should be available at /usr/local/share/ , for instance you can launch logtalk with swipl integration, using /usr/local/share/logtalk-3.28.0-stable/integration/swilgt.sh
# Prepare terraform install
yum -y install jq wget
tf_current_version=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
wget $(echo "https://releases.hashicorp.com/terraform/${tf_current_version}/terraform_${tf_current_version}_linux_amd64.zip")
unzip "terraform_${tf_current_version}_linux_amd64.zip"
sudo mv -v terraform /usr/local/bin/
rm -f "terraform_${tf_current_version}_linux_amd64.zip"

yum -y install htop
yum -y install moreutils
yum -y install asciidoc

git clone https://github.com/alexanderepstein/Bash-Snippets
cd Bash-Snippets
git checkout v1.22.1
./install.sh all
rm -rf Bash-Snippets
cd $HOME

# Install googler https://github.com/jarun/googler#installation
sudo curl -o /usr/local/bin/googler https://raw.githubusercontent.com/jarun/googler/v3.9/googler && sudo chmod +x /usr/local/bin/googler
