#!/usr/bin/env bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
