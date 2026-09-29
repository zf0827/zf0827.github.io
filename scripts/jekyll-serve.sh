#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

# Use the existing local Ruby installation when available. Other environments
# can select a compatible Ruby through their normal PATH/version manager.
if [[ -x /opt/homebrew/opt/ruby@3.1/bin/ruby ]]; then
  export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
fi

echo "Starting Jekyll preview. Press Ctrl-C to stop this server."
if [[ "${JEKYLL_LIVERELOAD:-0}" == "1" ]]; then
  exec bundle exec jekyll serve --livereload "$@"
else
  exec bundle exec jekyll serve "$@"
fi
