#!/usr/bin/env bash

# Installer script

## Colors ------------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

## Directories -------------------------
DIR="${0%/*}"
NVIM_DIR="$HOME/.local/share/nvim/plugged"

## Install Neovim Plugins --------------
echo -e ${BBlue}"\n[*] Installing plugins from nvim.txt" ${Color_Off}
if [[ -d "$NVIM_DIR" ]]; then
    cd $NVIM_DIR
	while read repo ; do
        git clone "$repo"
        echo 'Cloned ' $repo
    done < $DIR/nvim.txt
else
	mkdir -p "$NVIM_DIR"
    cd $NVIM_DIR
    while read repo ; do
        git clone "$repo"
        echo 'Cloned ' $repo
    done < $DIR/nvim.txt
fi
