#!/usr/bin/python

# requiers dbus-python python-gobject gdk-pixbuf2 gtk3

import argparse
import datetime
import hashlib
import json
import os
import random
import re
import subprocess
import typing

import gi
import dbus

gi.require_version("GdkPixbuf", "2.0")
gi.require_version("Gtk", "3.0")

from html.parser import HTMLParser

from dbus.mainloop.glib import DBusGMainLoop
from gi.repository import GdkPixbuf, GLib, Gtk

log_file = os.path.expandvars("$HOME/.cache/eww-notificacions/notifications.json")
cache_dir = os.path.expandvars("$HOME/.cache/eww-notificacions/image_data")
os.makedirs(cache_dir, exist_ok=True)


def clean_text(text):
    class HTMLTagStripper(HTMLParser):
        def __init__(self):
            super().__init__()
            self.reset()
            self.strict = False
            self.convert_charrefs = True
            self.text = []

        def handle_data(self, data):
            self.text.append(data)

        def get_text(self):
            return "".join(self.text)

    stripper = HTMLTagStripper()
    stripper.feed(text)
    text = stripper.get_text()
    text = re.sub(r"\s+", " ", text)
    text = text.replace('"', '\\"')
    return text.strip()


def save_img_byte(px_args: typing.Iterable, save_path: str):
    if os.path.exists(save_path):
        return
    image = GdkPixbuf.Pixbuf.new_from_bytes(
        width=px_args[0],
        height=px_args[1],
        has_alpha=px_args[3],
        data=GLib.Bytes(px_args[6]),
        colorspace=GdkPixbuf.Colorspace.RGB,
        rowstride=px_args[2],
        bits_per_sample=px_args[4],
    )
    resized_image = image.scale_simple(100, 100, GdkPixbuf.InterpType.BILINEAR)
    resized_image.savev(save_path, "png")


def get_gtk_icon(icon_name):
    theme = Gtk.IconTheme.get_default()
    icon_info = theme.lookup_icon(icon_name, 128, 0)
    if icon_info is not None:
        return icon_info.get_filename()


def notification_callback(bus, message):
    args_list = message.get_args_list()
    details = {
        "id": datetime.datetime.now().strftime("%s") + str(random.randint(0, 9)),
        "app": args_list[0] or "Unknown",
        "summary": clean_text(args_list[3]) or "Summary Unavailable",
        "body": clean_text(args_list[4]) or "Body Unavailable",
        "time": datetime.datetime.now().strftime("%H:%M"),
    }
    if args_list[2].strip():
        if "/" in args_list[2]:
            details["image"] = args_list[2]
        else:
            details["image"] = get_gtk_icon(args_list[2])
    else:
        details["image"] = None
    if "image-data" in args_list[6]:
        hash_object = hashlib.md5(details["body"].encode())
        image_filename = f"{cache_dir}/{hash_object.hexdigest()}.png"
        save_img_byte(args_list[6]["image-data"], image_filename)
        details["image"] = image_filename
    save_notification(details)


def update_eww(data):
    output_json = json.dumps(data, indent=2)
    with open(log_file, "w") as log:
        log.write(output_json)
    subprocess.run(["eww", "update", f"notifications={output_json}"])


def read_log_file():
    try:
        with open(log_file, "r") as log:
            return json.load(log)
    except FileNotFoundError:
        with open(log_file, "w") as log:
            json.dump({"count": 0, "notifications": []}, log)
        return {"count": 0, "notifications": []}


def save_notification(notification):
    current = read_log_file()
    current["notifications"].insert(0, notification)
    current["count"] = len(current["notifications"])
    update_eww(current)


def remove_notification(id):
    current = read_log_file()
    current["notifications"] = [n for n in current["notifications"] if n["id"] != id]
    current["count"] = len(current["notifications"])
    update_eww(current)


def clear_notifications():
    data = {"count": 0, "notifications": []}
    update_eww(data)


def notification_loop():
    DBusGMainLoop(set_as_default=True)
    bus = dbus.SessionBus()
    bus.add_match_string_non_blocking(
        "eavesdrop=true, interface='org.freedesktop.Notifications', member='Notify'"
    )
    bus.add_message_filter(notification_callback)
    loop = GLib.MainLoop()
    try:
        loop.run()
    except KeyboardInterrupt:
        bus.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--rmid", type=str, help="Remove notification by ID")
    parser.add_argument("--init", action="store_true", help="Start the loop")
    parser.add_argument("--clear", action="store_true", help="Clear the log file")
    parser.add_argument("--open", action="store_true", help="Update eww if its empty")
    args = parser.parse_args()

    if args.rmid:
        remove_notification(args.rmid)
    if args.init:
        notification_loop()
    if args.clear:
        clear_notifications()
    if args.open:
        curent = read_log_file()
        update_eww(curent)
