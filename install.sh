#! /bin/sh

Dir=$HOME/.PersonVim
mkdir $Dir
cd $Dir
git clone https://github.com/vim/vim.git
cd vim && ./configure && make -j `nproc` && make install
ln -s $Dir/config/vimrc $HOME/.vimrc
