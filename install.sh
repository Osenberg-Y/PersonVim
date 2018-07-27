#! /bin/sh

Dir=$HOME/.PersonVim
mkdir $Dir
cd $Dir
git clone https://github.com/vim/vim.git
cd vim

sudo apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
	libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev python3-dev ruby-dev lua5.1 lua5.1-dev
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
cd -
ln -s $Dir/config/vimrc $HOME/.vimrc

# install plugin mannager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install YCM plugin
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --go-completer --js-completer --java-completer -system-libclang
cp ~/.PersonVim/config/ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf
# Ctags
sudo apt-get install ctags
