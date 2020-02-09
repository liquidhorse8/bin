#!/bin/bash
unar "$1"
rm "$1"
notify-send "$1解凍終了"
