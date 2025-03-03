#!/bin/bash

sudo apt update && sudo apt upgrade -y
# Install text editor (nano)
sudo apt install nano -y

# Install networking utilities
sudo apt install iputils-ping traceroute nmap -y

# Install utilities for searching and man pages
sudo apt install man-db which -y

# Install file manager (ranger)
sudo apt install ranger -y

# Install additional useful tools
sudo apt install htop tmux fzf -y

# Install Neovim
sudo apt install neovim -y

echo "Check installed tools..."

ping -V
traceroute -v
nmap --version
ranger --version
tmux -V
fzf --version
nvim --version

echo "All successfully installed"
