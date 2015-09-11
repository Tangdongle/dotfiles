#!/bin/sh

echo "Setting up your dotfiles"
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
echo "Setup complete. Happy coding"
