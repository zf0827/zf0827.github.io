#!/bin/zsh

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"

if pgrep -af "jekyll serve|bundle exec jekyll serve|vendor/bundle/.*/jekyll serve" >/dev/null 2>&1; then
  echo "Jekyll preview is already running:"
  pgrep -af "jekyll serve|bundle exec jekyll serve|vendor/bundle/.*/jekyll serve"
  echo "Use scripts/jekyll-stop.sh to stop it first."
  exit 1
fi

echo "Starting Jekyll preview at http://127.0.0.1:4000"
if [[ "${JEKYLL_LIVERELOAD:-0}" == "1" ]]; then
  exec bundle exec jekyll serve --livereload
else
  exec bundle exec jekyll serve
fi
