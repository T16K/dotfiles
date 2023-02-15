#!/usr/bin/env bash

dir="$HOME/.config/rofi/launcher"
theme="style.rasi"

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}
