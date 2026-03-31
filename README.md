# zf0827.github.io

This branch uses the GitHub Pages `jekyll-theme-minimal` theme.

Pages kept intentionally small:

- Main site
- Publications
- CV

## Local debug

Use Homebrew Ruby 3.1 for local Jekyll work:

```bash
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
bundle install
scripts/jekyll-serve.sh
```

Useful process management helpers:

```bash
scripts/jekyll-status.sh
scripts/jekyll-stop.sh
```

Enable live reload only when needed:

```bash
JEKYLL_LIVERELOAD=1 scripts/jekyll-serve.sh
```
