#! /bin/sh

Dir=$HOME/.PersonVim
mkdir $Dir
cd $Dir
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
sudo make install
ln -s $Dir/config/vimrc $HOME/.vimrc

# install plugin mannager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install YCM plugin
cd ~/.vim/plugged/YouCompleteMe
./install.py --clang-completer --go-completer --js-completer --java-completer -system-libclang
cp ~/.PersonVim/config/ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf
