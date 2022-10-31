# T16K's dotfiles

## Installation

* First Clone this repository:
```
$ git clone https://github.com/T16K/dotfiles.git
```

## Dependecies

- **`feh`**: a lightweight and powerful image viewer.
- **`i3`**: a dynamic tiling window manager.
- **`kitty`**: a scriptable OpenGL based terminal emulator.
- **`neovim`**: a fork of `Vim` aiming to improve the codebase.
- **`picom`**: a standalone compositor for Xorg.
- **`polybar`**: a fast and easy-to-use tool for creating status bars.
- **`rofi`**: a window switcher, run dialog, ssh-launcher and `dmenu` replacement.
- **`xorg`**: is the most popular display server among Linux users.

### Extras

- **`neofetch`**: a fast, highly customizable system info script.
- **`qutebrowser`**: a keyboard-focused web browser.
- **`ranger`**: a text-based file manager.
- **`slim`**: an acronym for Simple Login Manager.
- **`yay`**: a pacman wrapper.

### Configuration using xorg.conf

```
/etc/X11/xorg.conf.d/10-monitor.conf
-----
Section "Monitor"
    Identifier "eDP-1"
    Option "Ignore" "true"
EndSection
```
