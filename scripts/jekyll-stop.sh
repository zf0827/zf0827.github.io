#!/bin/zsh

set -euo pipefail

patterns=(
  "jekyll serve"
  "bundle exec jekyll serve"
  "vendor/bundle/.*/jekyll serve"
  "vendor/bundle/.*/jekyll build"
  "bundle exec jekyll build"
)

stopped=0

for pattern in "${patterns[@]}"; do
  if pgrep -af "$pattern" >/dev/null 2>&1; then
    pkill -f "$pattern" || true
    stopped=1
  fi
done

if [[ "$stopped" -eq 1 ]]; then
  echo "Stopped Jekyll-related processes."
else
  echo "No Jekyll-related processes found."
fi
