#!/bin/sh

alpha='dd'
background='#282a36'
selection='#44475a'
comment='#6272a4'

yellow='#f1fa8c'
orange='#ffb86c'
red='#ff5555'
magenta='#ff79c6'
blue='#6272a4'
cyan='#8be9fd'
green='50fa7b'

swaylock \
    -c $background \
    --indicator-idle-visible \
    --inside-ver-color $selection \
    --inside-wrong-color $selection \
    --inside-color $selection \
    --ring-ver-color $comment \
    --ring-wrong-color $red \
    --ring-color $comment \
    --line-uses-ring \
    --key-hl-color $magenta \
    --bs-hl-color $orange \
    --separator-color $selection \
    --layout-bg-color $blue \
#   --date-color=$blue \
#   --time-color=$blue \
    --indicator \
    --time-str="%H:%M:%S" \
    --radius=120 \
    --ring-width=10 \
    --pass-media-keys \
    --pass-screen-keys \
    --pass-volume-keys \
#   --time-font="JetBrainsMono Nerd Font" \
#   --date-font="JetBrainsMono Nerd Font" \
#   --layout-font="JetBrainsMono Nerd Font" \
#   --verif-font="JetBrainsMono Nerd Font" \
#   --wrong-font="JetBrainsMono Nerd Font" \

# These last five lines are commented because they concern the font you want to use.
# JetBrainsMono Nerd Font is the font that was used in the screenshot.
# To specify a favorite font, just uncomment the five lines and replace the parameter with the font you prefer.
