#!/bin/sh
# don't turn on laptopt screen when reloading config if lid is shut
if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output LVDS-1 enable
else
    swaymsg output LVDS-1 disable
fi
