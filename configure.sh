sudo pacman -S curl
ssh-keygen -t rsa -b 4096 -C "andyferreira92@gmail.com"
vim .ssh/id_rsa.pub
gedit .ssh/id_rsa.pub
sudo pacman -S git vim python-dev python3 python-pip python3-dev python3-pip neovim pip3 python-pip3 postgresql trizen
git config --global user.name "Anderson Ferreira"
git clone https://github.com/ferreiraandy/.vim
ln -s ~/.vim/.vimrc ~/.vimrc

# sudo pacman -S silversearcher-ag ack-grep
sudo pacman -S ripgrep

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
nvim
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
mkdir projects
asdf plugin-add ruby
asdf install ruby 2.5.1
asdf global ruby 2.5.1
asdf install ruby 2.6.4

sudo passwd postgres
su postgres
sudo systemctl postgresql restart
su postgres
exit
sudo systemctl status postgresql
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo su - postgres -c "initdb --locale en_US.UTF-8 -D /var/lib/postgres/data'"
sudo systemctl status postgresql
sudo mkdir /var/lib/postgres/data
sudo -i -u postgres
sudo systemctl start postgresql.service
sudo systemctl status postgresql
su postgres
cd projects/vendamais-api/
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install slack --classic

sudo pacman -S base-devel openssl-1.0 llvm
asdf install ruby 2.5.1
sudo pacman -Sy mysql
sudo services mysql status
sudo service mysql status
sudo /etc/rc.d/mysqld start
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mariadb
sudo mysql_secure_installation
sudo systemctl mariadb
sudo systemctl mysql
asdf install ruby 2.2.10
sudo pacman -Qo /usr/lib/libssl.so
asdf install ruby 2.6.5
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs
asdf update --head
asdf list-all nodejs
asdf install nodejs 10.3.0
asdf reshim
rspec -fp
export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
asdf install ruby 2.2.10
sudo trizen -S click
