#!/bin/sh

## Colors ------------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

## Directories -------------------------
DIR="${0%/*}/install.txt"

echo -e ${BBlue}"\n === Setting up your Arch installation to be somewhat great. === " ${Color_Off}

## Installations -----------------------
echo -e ${BYellow}"[*] Installing packages..." ${Color_Off}
grep -vE "^\s*(#|$)" $DIR | sudo pacman -S --noconfirm -

echo -e ${BGreen}"[*] All packages have been successfully installed.\n" ${Color_Off}
