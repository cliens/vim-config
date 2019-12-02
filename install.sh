#! /bin/bash
echo "installing ..."
cp .vimrc ~
cp .vimrc.bundles ~

echo "installing dependences..."
# type brew > /dev/null 2 > &1 || { echo >&2 "I require foo but it's not installed.  Aborting."; exit 1; }

# ack required
brew install ag

# youcomplete required
brew install curl
brew install cmake

# git clone --recursive https://github.com/ycm-core/YouCompleteMe.git
# 确保完整性和最新
# git submodule update --init --recursive

echo "successful!"
