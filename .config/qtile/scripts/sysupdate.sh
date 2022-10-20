#!/usr/bin/env bash

###Create a timeshift btrfs backup before update:
sudo timeshift --create --comments "Before Update" &&

###Update Arch package(s):
sudo pacman -Syu &&

###Update AUR package(s):
paru -Sua &&

printf "System Updated has Completed\nPress Any Key To Exit."
read answer
if [ $answer = " " ]; then
    exit 0
else
    exit 0
fi
