#!/usr/bin/env bash
curl -sL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -o nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
sudo cp -a nvim-linux64/* /usr/
rm -rf nvim-linux64
rm nvim-linux64.tar.gz
