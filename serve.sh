#!/usr/bin/env bash
# Local live preview of the site, reachable over the network (like your Jupyter).
#
# Prerequisite (one-time): the conda env "homepage" with Ruby/Node/ImageMagick and
# gems installed — see the "Local preview" section of README.md.
#
# Usage:  ./serve.sh            # serves on all interfaces, port 4000
#         ./serve.sh 8000       # use a different port
#
# Then open  http://<this-server-ip>:<port>/  in your browser
# (e.g. http://REDACTED:4000/).
set -euo pipefail
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${1:-4000}"

# Best-effort detection of the server's outward IP (for the message below).
IP="$(hostname -I 2>/dev/null | tr ' ' '\n' | grep -v '^127\.' | head -1)"
echo "============================================================"
echo "  Open in your browser:  http://${IP:-<server-ip>}:${PORT}/"
echo "  (Ctrl-C to stop)"
echo "============================================================"

source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate homepage

# --host 0.0.0.0 makes it reachable via the server IP.
# --livereload auto-refreshes the browser on save (uses extra port 35729).
exec bundle _4.0.6_ exec jekyll serve --host 0.0.0.0 --port "$PORT" --livereload
