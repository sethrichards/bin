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
    xgrep "$search_string" "*.hh"
    xgrep "$search_string" "*.c"
    xgrep "$search_string" "*.cpp"
    xgrep "$search_string" "*.cxx"
    xgrep "$search_string" "*.cc"
    xgrep "$search_string" "*.cs"
}
alias cgrep="do_cgrep"

do_hgrep() {
    local search_string=$1
    xgrep "$search_string" "*.h"
    xgrep "$search_string" "*.hpp"
    xgrep "$search_string" "*.hxx"
    xgrep "$search_string" "*.hh"
}
alias hgrep="do_hgrep"

do_mgrep() {
    local search_string = $1
    xgrep "$search_string" "Make*"
}
alias mgrep="do_mgrep"

do_igrep() {
    local search_string=$1
    grep -iHnr --color "$search_string" "*"
}
alias igrep="do_igrep"

alias grep="grep --color -Hn -i"

alias xfind="find . -iname"

# Git aliases
alias g-substatus="git status -s; git submodule foreach 'git status -s'"
alias g-substatus-u="git status -s -uno; git submodule foreach 'git status -s -uno'"
alias g-substatus-i="git status -s --ignored; git submodule foreach 'git status -s --ignored'"
alias g-subclean="git clean -fdx; git submodule foreach 'git clean -fdx'"

# GCC colorization
# Add -fdiagnostics-color=[auto|never|always] to GCC_FLAGS.
# See here: https://xaizek.github.io/2015-10-25/enable-colorization-of-gcc-output/
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add a nice prompt with Git status
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

#export PS1="\u@\h:\w\ \`parse_git_branch\`-> "
#export PS1="\[\e[30;42m\]\u\[\e[m\]\[\e[30;42m\]@\[\e[m\]\[\e[30;42m\]\h\[\e[m\]\[\e[30;42m\]:\[\e[m\]\[\e[30;44m\]\w\[\e[m\]\[\e[44m\] \[\e[m\]\[\e[30;46m\]\`parse_git_branch\`\[\e[m\]\n-> "

#export PS1="\[\e[32;40m\]\u\[\e[m\]\[\e[32;40m\]@\[\e[m\]\[\e[32;40m\]\h\[\e[m\]\[\e[32;40m\]:\[\e[m\]\[\e[34;40m\]\w\[\e[m\]\[\e[40m\] \[\e[m\]\[\e[36;40m\]\`parse_git_branch\`\[\e[m\]\n-> "

export PS1="\[\e[32;49m\]\u\[\e[m\]\[\e[32;49m\]@\[\e[m\]\[\e[32;49m\]\h\[\e[m\]\[\e[32;49m\]:\[\e[m\]\[\e[34;49m\]\w\[\e[m\]\[\e[49m\] \[\e[m\]\[\e[36;49m\]\`parse_git_branch\`\[\e[m\]\n-> "
