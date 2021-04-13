#!/bin/bash

set -euxo pipefail

scripts_dir="$(dirname "${BASH_SOURCE[0]}")"
cd "$scripts_dir"
emacs -batch -q -l setup.el -f org-publish-all
