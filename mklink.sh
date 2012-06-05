#!/bin/sh
cd `dirname ${0}`
cwd=`pwd`
ln -s -F "${cwd}/emacs.d" ~/.emacs.d

