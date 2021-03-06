#!/bin/bash
set -e

# install rbenv
sudo yum install -y git gcc bzip2 openssl-devel readline-devel zlib-devel
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# install ruby
rbenv install 2.2.3
rbenv rehash
rbenv global 2.2.3

# install vim
sudo yum install -y lua-devel ncurses-devel
git clone https://github.com/vim/vim.git
cd vim
./configure --prefix=/usr/local --with-features=huge --enable-multibyte --enable-rubyinterp --enable-luainterp --enable-cscope --enable-fail-if-missing
make
sudo make install


# install RSense
cd
sudo yum install -y java-1.8.0-openjdk wget
wget http://cx4a.org/pub/rsense/rsense-0.3.tar.bz2
bzip2 -dc rsense-0.3.tar.bz2 | tar xvf -
sudo cp -r rsense-0.3 /usr/local/lib
sudo chmod +x /usr/local/lib/rsense-0.3/bin/rsense

# gem
gem install rubocop refe2
bitclust setup

# install ctags
sudo yum install -y ctags

# install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# setting vim
mkdir ~/.vim/indent
ln -s /vagrant/setting/ruby.vim ~/.vim/indent/ruby.vim
ln -s /vagrant/setting/vimrc ~/.vimrc

# install rails
sudo yum install -y sqlite-devel
gem install rails -v 5.0.0.1

# install nodejs
curl -L git.io/nodebrew | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> .bash_profile
source ~/.bash_profile
nodebrew install-binary v6.9.5
nodebrew use v6.9.5

# install heroku cli
wget -qO- https://toolbelt.heroku.com/install.sh | sh
echo 'PATH="/usr/local/heroku/bin:$PATH"' >> ~/.bash_profile


# install bash-completion
sudo yum install -y bash-completion
echo '[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion' >> ~/.bash_profile
#source ~/.bash_profile

# git clone git@github.com:gomesuit/rails-practice.git

sudo yum install -y ImageMagick


