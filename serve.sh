#!/usr/bin/env bash
# Local live preview of the site.
#
# Prerequisite (one-time): the conda env "homepage" with Ruby/Node/ImageMagick and
# gems installed — see the "Local preview" section of README.md.
#
# Usage:  ./serve.sh            # serves at http://localhost:4000 with live reload
#         ./serve.sh 8080       # use a different port
set -euo pipefail
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${1:-4000}"

# Activate the conda env (works whether or not conda is already initialized).
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate homepage

exec bundle _4.0.6_ exec jekyll serve --host 127.0.0.1 --port "$PORT" --livereload
