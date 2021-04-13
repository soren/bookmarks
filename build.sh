#!/bin/sh

scripts_dir=$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)
cd "$scripts_dir" || exit 1

emacs -batch -q -l setup.el -f org-publish-all
