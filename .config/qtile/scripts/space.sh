#!/bin/bash

echo "Primary Drive:"
duf -all

printf "Finished?\n Type 'y' to exit\n"

read answer
if [ $answer = "y" ]; then
    exit 0
elif [ $answer = "n" ]; then
    printf "Need something else?"
else
    exit 1
fi
