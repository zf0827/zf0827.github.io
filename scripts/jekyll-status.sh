#!/bin/zsh

set -euo pipefail

if pgrep -af "jekyll|bundle exec jekyll|vendor/bundle/.*/jekyll" >/dev/null 2>&1; then
  echo "Active Jekyll-related processes:"
  pgrep -af "jekyll|bundle exec jekyll|vendor/bundle/.*/jekyll"
else
  echo "No active Jekyll-related processes."
fi
