echo "========================================================================="
echo "                     Starting installations                              "
echo "========================================================================="

echo "Please enter your Name:"
read name

sudo pacman -Sy curl

echo "========================================================================="
echo "                     GIT                                                 "
echo "========================================================================="

echo "Please enter your github loggin:"
read loggin


ssh-keygen -t rsa -b 4096 -C $loggin

gedit .ssh/id_rsa.pub
sudo pacman -Syu git vim python-dev python3 python-pip python3-dev python3-pip neovim pip3 python-pip3 postgresql trizen

sudo pacman -S dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland mutter


git config --global user.name $name

echo "========================================================================="
echo "                     NVIM                                                "
echo "========================================================================="

git clone https://github.com/ferreiraandy/.vim
ln -s ~/.vim/.vimrc ~/.vimrc

# sudo pacman -S silversearcher-ag ack-grep
sudo pacman -Syu ripgrep

mkdir .config
mkdir .config/nvim

cat > ~/.config/nvim/init.vim <<EOL
  set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc
EOL

source ~/.bashrc
python3 -m pip install --user --upgrade pynvim
source ~/.bashrc

echo "========================================================================="
echo "                     ASDF                                                "
echo "========================================================================="

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

mkdir projects
asdf plugin-add ruby
asdf install ruby 2.5.1
asdf global ruby 2.5.1
asdf install ruby 2.6.4

sudo pacman -S base-devel openssl-1.0 llvm
asdf install ruby 2.5.1
asdf install ruby 2.2.10
sudo pacman -Qo /usr/lib/libssl.so
asdf install ruby 2.6.5
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf update --head
asdf install nodejs 10.3.0
asdf reshim

export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
asdf install ruby 2.2.10

asdf plugin-add rust
asdf install rust 1.40.0
trizen -S click

echo "========================================================================="
echo "                     PostgreSQL                                          "
echo "========================================================================="

sudo passwd postgres
su postgres

sudo systemctl postgresql restart
sudo mkdir /var/lib/postgres/data
sudo su - postgres -c "initdb --locale en_US.UTF-8 -D /var/lib/postgres/data"
sudo systemctl status postgresql
sudo -i -u postgres
sudo systemctl start postgresql.service
sudo systemctl status postgresql
su postgres


echo "========================================================================="
echo "                     SNAPS                                               "
echo "========================================================================="

sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install slack --classic


echo "========================================================================="
echo "                     Configurations completed                            "
echo "========================================================================="

echo "Now you can install Vim pluggins inside NVIM"

echo "Todo: "
echo "configure Chrome"
echo "configure MySQL"

read
