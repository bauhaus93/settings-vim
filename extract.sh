#!/bin/sh
mkdir -p ~/.vim ~/.vim/snippets ~/.vim/plugin
cp .vimrc ~/.vimrc
cp -r snippets/* ~/.vim/snippets/
cp -r plugin/ ~/.vim/plugin
