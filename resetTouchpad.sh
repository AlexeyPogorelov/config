#!/bin/bash

TID=$(xinput list | grep -iPo 'touchpad.*id=\K\d+')
id="$TID"

echo "Found TouchPad device under $id. Reloading..."
xinput disable $id
xinput enable $id

