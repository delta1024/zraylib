#!/usr/bin/env bash
if [ 1 -ne $# ]; then
	>&2 echo "Usage: ./archive.sh <branch | tag>" 
	exit 1
fi
set -x
# archive main directory
git archive --format tar -o raylib.tar $@
# decend recursively and archive each submodule
git submodule --quiet foreach --recursive \
	'git archive --format tar --prefix=$displaypath/ -o submodule.tar HEAD'
# concatenate with main archive
TOPDIR=$(pwd) git submodule --quiet foreach --recursive 'cd $TOPDIR; tar --concatenate --file=raylib.tar $displaypath/submodule.tar; rm -fv $displaypath/submodule.tar'
gzip -9 raylib.tar

