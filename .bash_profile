# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#############################
#   ENVIRONMENT VARIABLES   #
#############################

# text editor
export EDITOR=nvim
export VISUAL=nvim

# nnn file manager
export NNN_TRASH=1 # 1=trash-cli; 2=gio trash
export NNN_OPTS="AedH"

# bemenu lancher
export BEMENU_BACKEND="wayland"
export BEMENU_OPTS="--tb '#282828' --tf '#d3869b' --fb '#282828' --hf '#d3869b' --nb '#282828' --ab '#282828' --hb '#282828' --single-instance -H 24 --ch 18"



# User specific environment and startup programs
. "$HOME/.cargo/env"
