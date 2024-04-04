#!/usr/bin/bash

# Set XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR


export DISPLAY=:1
export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# rotate screen if env variable is set [normal, inverted, left or right]
if [[ ! -z "$ROTATE_DISPLAY" ]]; then
  echo "YES"
  (sleep 3 && DISPLAY=:0 xrandr -o $ROTATE_DISPLAY) & 
fi

# start desktop manager
echo "STARTING X"
startx

# uncomment to start x without mouse cursor
# startx -- -nocursor

# uncomment to open an application instead of the desktop
# startx xterm  
