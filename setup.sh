#!/bin/bash -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -i -s $SCRIPT_DIR/.zshrc $HOME/.zshrc
ln -i -s $SCRIPT_DIR/.ideavimrc $HOME/.ideavimrc
