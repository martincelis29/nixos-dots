#!/usr/bin/env bash

# Requires  hyprpicker, imagemagick, wl-clipboard

TEMP_DIR="/tmp/colorpicker"

[ ! -d "$TEMP_DIR" ] && mkdir -pv "$TEMP_DIR"

ColorPicker() {
  HEX=$(hyprpicker)
  FNAME="$TEMP_DIR/$HEX.png"

  [ ! -f "$FNAME" ] && convert -size 100x100 xc:"$HEX" "$FNAME"

  wl-copy "$HEX"
  notify-send -u low -a "Color Picker" -i "$FNAME" "$HEX" "Copied to clipboard"
}

Abort() {
  notify-send -a "Color Picker" -i dialog-error "Error" "Operation aborted"
  exit 1
}

ColorPicker || Abort
