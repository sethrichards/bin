#!/bin/bash
# Include file for .bashrc for custom tweaks. Add:
#
# source ~/bin/bashrc-include.sh
#
# to ~/.bashrc

#alias ls='ls -sF --color'
#alias la='ls -asF --color'
#alias ll='ls -lF --color'

do_xgrep() {
    local search_string=$1
    shift
    local search_files=$@
    #echo $search_string
    #echo $search_files
    #echo find . -iname "$search_files" -print0 | xargs -0 grep -iHn --color "$search_string"
    find . -iname "$search_files" -print0 | xargs -0 grep -iHn --color "$search_string"
}
alias xgrep="do_xgrep"

do_cgrep() {
    local search_string=$1
    xgrep "$search_string" "*.h"
    xgrep "$search_string" "*.hpp"
    xgrep "$search_string" "*.hxx"
    xgrep "$search_string" "*.c"
    xgrep "$search_string" "*.cpp"
    xgrep "$search_string" "*.cxx"
    xgrep "$search_string" "*.cs"
}
alias cgrep="do_cgrep"

do_hgrep() {
    local search_string=$1
    xgrep "$search_string" "*.h"
    xgrep "$search_string" "*.hpp"
    xgrep "$search_string" "*.hxx"
}
alias hgrep="do_hgrep"

do_igrep() {
    local search_string=$1
    grep -iHnr --color "$search_string" "*"
}
alias igrep="do_igrep"

alias ygrep='grep -iHnr --color'

alias grep="grep --color -Hn -i"
