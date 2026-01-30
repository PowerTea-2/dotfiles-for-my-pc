#!/bin/bash

MENU=$(printf "Shutdown\nReboot\nSuspend\nLock\nCancel" | wofi --dmenu --prompt "Power" --lines 5 --style ~/.config/wofi/style.css --width 300 --cache-file /dev/null)

case "$MENU" in
  Shutdown) systemctl poweroff ;;
  Reboot)   systemctl reboot ;;
  Suspend)  systemctl suspend ;;
  Lock)     hyprctl dispatch dpms off ;;
  *) exit 0 ;;
esac
