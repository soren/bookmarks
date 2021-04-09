#!/bin/bash

set -euxo pipefail

emacs -batch -q -l setup.el -f org-publish-all
