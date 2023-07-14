#!/usr/bin/env bash

# Installer script

## Colors ------------------------------
Color_Off='\033[0m'
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

## Directories -------------------------
DIR="${0%/*}"
DOT_DIR="$DIR/../dotfiles/config"
FONT_DIR="$HOME/.local/share/fonts"
WALL_DIR="$HOME/Wallpapers"
CONF_DIR="$HOME/.config"
X11_DIR="$HOME/.xinitrc"
ZSH_DIR="$HOME/.zshrc"
XMODMAP_DIR="$HOME/.Xmodmap"

# Install Fonts ------------------------
install_fonts() {
	echo -e ${BBlue}"\n[*] Installing fonts..." ${Color_Off}
	if [[ -d "$FONT_DIR" ]]; then
		cp -rf $DIR/../fonts/* "$FONT_DIR"
	else
		mkdir -p "$FONT_DIR"
		cp -rf $DIR/../fonts/* "$FONT_DIR"
	fi
	echo -e ${BYellow}"[*] Updating font cache..." ${Color_Off}
	fc-cache
}

# Install Wallpapers -------------------
install_wall() {
	echo -e ${BBlue}"\n[*] Installing wallpapers...\n" ${Color_Off}
	if [[ -d "$WALL_DIR" ]]; then
		cp -rf $DIR/../wallpapers/* "$WALL_DIR"
	else
		mkdir -p "$WALL_DIR"
		cp -rf $DIR/../wallpapers/* "$WALL_DIR"
	fi
}

# Install .config Files 

## Install i3 Config -------------------
install_i3() {
	if [[ -d "$CONF_DIR/i3" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your i3 configs..." ${Color_Off} 
		mv "$CONF_DIR/i3" "${CONF_DIR}/i3.old"
    fi
    echo -e ${BBlue}"[*] Installing i3 configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/i3"; cp -rf $DOT_DIR/i3/* "$CONF_DIR/i3"; }

	if [[ -f "$CONF_DIR/i3/config" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install Kitty Config ----------------
install_kitty() {
	if [[ -d "$CONF_DIR/kitty" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your kitty configs..." ${Color_Off} 
		mv "$CONF_DIR/kitty" "${CONF_DIR}/kitty.old"
    fi
    echo -e ${BBlue}"[*] Installing kitty configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/kitty"; cp -rf $DOT_DIR/kitty/* "$CONF_DIR/kitty"; }

	if [[ -f "$CONF_DIR/kitty/kitty.conf" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install mpv Config ------------------
install_mpv() {
	if [[ -d "$CONF_DIR/mpv" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your mpv configs..." ${Color_Off} 
		mv "$CONF_DIR/mpv" "${CONF_DIR}/mpv.old"
    fi
    echo -e ${BBlue}"[*] Installing mpv configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/mpv"; cp -rf $DOT_DIR/mpv/* "$CONF_DIR/mpv"; }

	if [[ -f "$CONF_DIR/mpv/mpv.conf" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install Neovim Config ---------------
install_nvim() {
	if [[ -d "$CONF_DIR/nvim" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your neovim configs..." ${Color_Off} 
		mv "$CONF_DIR/nvim" "${CONF_DIR}/nvim.old"
    fi
    echo -e ${BBlue}"[*] Installing neovim configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/nvim"; cp -rf $DOT_DIR/nvim/* "$CONF_DIR/nvim"; }

	if [[ -f "$CONF_DIR/nvim/init.vim" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install Polybar Theme ---------------
install_poly() {
	if [[ -d "$CONF_DIR/polybar" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your polybar configs..." ${Color_Off} 
		mv "$CONF_DIR/polybar" "${CONF_DIR}/polybar.old"
    fi
    echo -e ${BBlue}"[*] Installing polybar configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/polybar"; cp -rf $DOT_DIR/polybar/* "$CONF_DIR/polybar"; }

	if [[ -f "$CONF_DIR/polybar/launch.sh" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install qutebrowser Config ----------
install_qute() {
	if [[ -d "$CONF_DIR/qutebrowser" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your qutebrowser configs..." ${Color_Off} 
		mv "$CONF_DIR/qutebrowser" "${CONF_DIR}/qutebrowser.old"
    fi
    echo -e ${BBlue}"[*] Installing qutebrowser configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/qutebrowser"; cp -rf $DOT_DIR/qutebrowser/* "$CONF_DIR/qutebrowser"; }

	if [[ -f "$CONF_DIR/qutebrowser/bookmarks/urls" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
	xdg-mime default org.pwmt.zathura.desktop application/pdf
}

## Install ranger Config ---------------
install_rang() {
	if [[ -d "$CONF_DIR/ranger" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your ranger configs..." ${Color_Off} 
		mv "$CONF_DIR/ranger" "${CONF_DIR}/ranger.old"
    fi
    echo -e ${BBlue}"[*] Installing ranger configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/ranger"; cp -rf $DOT_DIR/ranger/* "$CONF_DIR/ranger"; }

	if [[ -f "$CONF_DIR/ranger/scope.sh" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install Rofi Theme ------------------
install_rofi() {
	if [[ -d "$CONF_DIR/rofi" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your rofi configs..." ${Color_Off}
		mv "$CONF_DIR/rofi" "${CONF_DIR}/rofi.old"
	fi
	echo -e ${BBlue}"[*] Installing rofi configs..." ${Color_Off}
	{ mkdir -p "$CONF_DIR/rofi"; cp -rf $DOT_DIR/rofi/* "$CONF_DIR/rofi"; }

	if [[ -f "$CONF_DIR/rofi/config.rasi" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install zathura Config ---------------
install_zat() {
	if [[ -d "$CONF_DIR/zathura" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your zathura configs..." ${Color_Off} 
		mv "$CONF_DIR/zathura" "${CONF_DIR}/zathura.old"
    fi
    echo -e ${BBlue}"[*] Installing zathura configs..." ${Color_Off}
    { mkdir -p "$CONF_DIR/zathura"; cp -rf $DOT_DIR/zathura/* "$CONF_DIR/zathura"; }

	if [[ -f "$CONF_DIR/zathura/zathurarc" ]]; then
		echo -e ${BGreen}"[*] Successfully Installed.\n" ${Color_Off}
	else
		echo -e ${BRed}"[!] Failed to install.\n" ${Color_Off}
	fi
}

## Install .xinitrc ------------------
install_X11() {
	if [[ -f "$X11_DIR" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your .xinitrc..." ${Color_Off}
		mv "$X11_DIR" "${X11_DIR}.old"
	fi
	echo -e ${BBlue}"[*] Installing .xinitrc...\n" ${Color_Off}
	{ cp $DIR/../dotfiles/xinitrc "$X11_DIR"; }
}

## Install .zshrc ----------------------
install_ZSH() {
	if [[ -f "$ZSH_DIR" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your .zshrc..." ${Color_Off}
		mv "$ZSH_DIR" "${ZSH_DIR}.old"
	fi
	echo -e ${BBlue}"[*] Installing .zshrc...\n" ${Color_Off}
	{ cp $DIR/../dotfiles/zshrc "$ZSH_DIR"; }
}

## Install .Xmodmap --------------------
install_XMODMAP() {
	if [[ -f "$XMODMAP_DIR" ]]; then
		echo -e ${BPurple}"[*] Creating a backup of your .Xmodmap..." ${Color_Off}
		mv "$XMODMAP_DIR" "${XMODMAP_DIR}.old"
	fi
	echo -e ${BBlue}"[*] Installing .Xmodmap...\n" ${Color_Off}
	{ cp $DIR/../dotfiles/Xmodmap "$ZSH_DIR"; }
}



# Main
main() {
	install_fonts
    install_wall
    install_i3
    install_kitty
    install_mpv
    install_nvim
	install_poly
    install_qute
    install_rang
    install_rofi
    install_zat
    install_X11
    install_ZSH
    install_XMODMAP
}

main
