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

PS1='\[\e[${PROMPT_COLOR:-32}m\]\u@\h\[\e[0m\]:\[\e[${PROMPT_COLOR:-32}m\]\w\[\e[0;31m\]${?#0}\[\e[0m\]\$ '


# User specific environment and startup programs
