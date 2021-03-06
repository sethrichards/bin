#!/bin/bash

#echo "bashrc-git.sh"

# Git aliases
#alias g-substatus="git status -s; git submodule foreach 'git status -s'"
alias g-substatus-u="git status -s -uno; git submodule foreach 'git status -s -uno'"
alias g-substatus-i="git status -s --ignored; git submodule foreach 'git status -s --ignored'"
alias g-subclean="git clean -fdx; git submodule foreach 'git clean -fdx'"
#alias g-log="git log --oneline --graph --decorate=short"

function g-log() {
    #git log --graph --pretty=format:"%C(yellow)%<(10)%h%C(green)%<(16)%aN%C(cyan)%<(14)%ar%C(auto)%d%n%w(80,3,3)%C(auto)%<(2)%s" "$@"
    git log --graph --pretty=format:"%C(yellow)%<(9)%h %C(green)%<(15)%aN %C(cyan)%<(14)%ar %n%w(80,2,2)%C(auto)%C(auto)%<(2)%s %w(80,1,1)%+d" "$@"
}

TEXT_BOLD='\e[1m'
TEXT_RED='\e[31m'
TEXT_CYAN='\e[36m'
TEXT_RESET='\033[0m'

function g-substatus-m() {
    #echo "$name"
    if [[ -n $(git status -s) ]]; then
        #echo $sm_path:
        echo -e "${TEXT_CYAN}${TEXT_BOLD}${displaypath} :${TEXT_RESET}"
        git status -s
    fi
}
export -f g-substatus-m

function g-substatus() {

    #if [[ -n $(git status -s) ]]; then
    #    echo -e "${TEXT_CYAN}Top Level :${TEXT_RESET}"
    #    git status -s
    #fi
    displaypath="Top Level"
    g-substatus-m
    git submodule foreach --quiet "g-substatus-m"
}

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
