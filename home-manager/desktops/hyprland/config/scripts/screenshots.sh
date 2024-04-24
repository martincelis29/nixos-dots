#!/usr/bin/env bash

# Requires  grim, slurp, wl-clipboard, wl-screenrec

IMG_DIR="$HOME/Pictures/Screenshots"
VID_DIR="$HOME/Videos/Screencasting"

[ ! -d "$IMG_DIR" ] && mkdir -pv "$IMG_DIR"
[ ! -d "$VID_DIR" ] && mkdir -pv "$VID_DIR"

IMG="${IMG_DIR}/Screenshot $(date +'%d-%m-%Y') at $(date +'%H:%M:%S').png"
VID="${VID_DIR}/Screen Recording $(date +'%d-%m-%Y') at $(date +'%H:%M:%S').mp4"

Default_Sink="$(pactl get-default-sink).monitor"
Default_Source="$(pactl get-default-source)"

Load_Modules() {
    Module="$(pactl load-module module-null-sink sink_name=Combined)"
    Module_Sink="$(pactl load-module module-loopback sink=Combined source=$Default_Sink)"
    Module_Source="$(pactl load-module module-loopback sink=Combined source=$Default_Source)"
}

Unload_Modules() {
    pactl unload-module "$Module"
    pactl unload-module "$Module_Sink"
    pactl unload-module "$Module_Source"
}

Screenshot_Full() {
    grim "$IMG"
}

Screenshot_Crop() {
    grim -g "$(slurp)" "$IMG"
}

Screencast_Full() {
    wl-screenrec --filename "$VID"
}

Screencast_Full_Audio_Output() {
    wl-screenrec --audio --audio-device "$Default_Sink" --filename "$VID"
}

Screencast_Full_Audio_Input() {
    wl-screenrec --audio --audio-device "$Default_Source" --filename "$VID"
}

Screencast_Full_Audio_Both() {
    wl-screenrec --audio --audio-device Combined.monitor --filename "$VID"
}

Screencast_Crop() {
    wl-screenrec -g "$(slurp)" --filename "$VID"
}

Screencast_Crop_Audio_Output() {
    wl-screenrec --audio --audio-device "$Default_Sink" -g "$(slurp)" --filename "$VID"
}

Screencast_Crop_Audio_Input() {
    wl-screenrec --audio --audio-device "$Default_Source" -g "$(slurp)" --filename "$VID"
}

Screencast_Crop_Audio_Both() {
    wl-screenrec --audio --audio-device Combined.monitor -g "$(slurp)" --filename "$VID"
}

Abort() {
    Unload_Modules
    notify-send -a "Screenshot info" -i dialog-error "Error" "Operation aborted"
    exit 1
}

case "$1" in
screenshot_full)
    Screenshot_Full || Abort
    wl-copy <"$IMG"
    notify-send -u low -a "Screenshot Info" -i "$IMG" "Screenshot captured" "$IMG"
    ;;
screenshot_crop)
    Screenshot_Crop || Abort
    wl-copy <"$IMG"
    notify-send -u low -a "Screenshot Info" -i "$IMG" "Screenshot captured" "$IMG"
    ;;
record_full)
    Screencast_Full || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_full_audio_output)
    Screencast_Full_Audio_Output || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_full_audio_input)
    Screencast_Full_Audio_Input || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_full_audio_both)
    Load_Modules
    Screencast_Full_Audio_Both || Abort
    Unload_Modules
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_crop)
    Screencast_Crop || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_crop_audio_output)
    Screencast_Crop_Audio_Output || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_crop_audio_input)
    Screencast_Crop_Audio_Input || Abort
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
record_crop_audio_both)
    Load_Modules
    Screencast_Crop_Audio_Both || Abort
    Unload_Modules
    notify-send -u low -a "Screenshot Info" "Screencast recorded" "$VID"
    ;;
*)
    echo "Usage: $0 { screenshot_full | screenshot_crop | record_full | record_full_audio | record_crop | record_crop_audio }"
    exit 1
    ;;
esac
