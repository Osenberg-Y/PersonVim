#! /bin/sh

ProDir=$HOME/.PersonVim
mkdir -p $ProDir
Dir=`pwd`
cd $Dir
cp -Rf $Dir/* $ProDir

sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev
sudo apt-get install -y curl
sudo apt-get remove -y vim vim-runtime gvim
sudo apt-get remove -y vim-tiny vim-common vim-gui-common vim-nox

sudo rm -rf ~/vim
sudo rm -rf /usr/share/vim/vim74
sudo rm -rf /usr/share/vim/vim80
sudo rm -rf /usr/share/vim/vim81
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
		--enable-multibyte \
		--enable-rubyinterp \
		--enable-pythoninterp \
		--with-python-config-dir=/usr/lib/python2.7/config \
		--enable-perlinterp \
		--enable-luainterp \
		--enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim81
sudo make install
rm $HOME/.vimrc
ln -s $ProDir/config/vimrc $HOME/.vimrc
sudo ln -s /usr/bin/vim /usr/bin/vi

# install plugin mannager
rm -Rf $HOME/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.vim/plugged

# install YCM plugin
# cd $HOME/.vim/plugged
# git clone https://github.com/Valloric/YouCompleteMe.git
# cd $HOME/.vim/plugged/YouCompleteMe
# git submodule update --init --recursive
# ./install.py --clang-completer
# cp $ProDir/config/ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf
# Ctags
sudo apt-get install -y ctags
