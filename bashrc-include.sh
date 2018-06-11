#!/bin/bash
# Include file for .bashrc for custom tweaks. Add:
#
# source ~/bin/bashrc-include.sh
#
# to ~/.bashrc

#alias ls='ls -sF --color'
#alias la='ls -asF --color'
#alias ll='ls -lF --color'

#echo "bashrc-include.sh"

source ~/bin/bashrc-grep.sh
source ~/bin/bashrc-git.sh

# GCC colorization
# Add -fdiagnostics-color=[auto|never|always] to GCC_FLAGS.
# See here: https://xaizek.github.io/2015-10-25/enable-colorization-of-gcc-output/
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

#export PS1="\u@\h:\w\ \`parse_git_branch\`-> "
#export PS1="\[\e[30;42m\]\u\[\e[m\]\[\e[30;42m\]@\[\e[m\]\[\e[30;42m\]\h\[\e[m\]\[\e[30;42m\]:\[\e[m\]\[\e[30;44m\]\w\[\e[m\]\[\e[44m\] \[\e[m\]\[\e[30;46m\]\`parse_git_branch\`\[\e[m\]\n-> "

#export PS1="\[\e[32;40m\]\u\[\e[m\]\[\e[32;40m\]@\[\e[m\]\[\e[32;40m\]\h\[\e[m\]\[\e[32;40m\]:\[\e[m\]\[\e[34;40m\]\w\[\e[m\]\[\e[40m\] \[\e[m\]\[\e[36;40m\]\`parse_git_branch\`\[\e[m\]\n-> "

export PS1="\[\e[32;49m\]\u\[\e[m\]\[\e[32;49m\]@\[\e[m\]\[\e[32;49m\]\h\[\e[m\]\[\e[32;49m\]:\[\e[m\]\[\e[34;49m\]\w\[\e[m\]\[\e[49m\] \[\e[m\]\[\e[36;49m\]\`parse_git_branch\`\[\e[m\]\n-> "
