#!/bin/bash
# From Stack Overflow, https://stackoverflow.com/questions/36646323/generate-patch-of-uncommitted-changes-for-git-repo-and-submodules
#
#git submodule --quiet foreach --recursive 'export NAME="${PWD##*/}"; git --no-pager diff --src-prefix="a/${NAME}/" --dst-prefix="b/${NAME}/"'
#

export STARTDIR=${PWD}
echo ${STARTDIR}
git submodule --quiet foreach --recursive 'export NAME="${PWD##*/}"; \
                                           git --no-pager diff > ${STARTDIR}/${NAME}.diff'
