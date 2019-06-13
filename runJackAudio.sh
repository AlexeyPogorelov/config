#!/bin/bash

pacmd load-module module-jack-sink channels=2
pactl set-default-sink jack_out

jack-rack ~/.config/jack-rack/surface
qjackctl

