# Yunxiang Wei — academic website

A self-contained Jekyll site with no theme, remote theme, custom plugin, or frontend build pipeline. All layout and styling belong to this repository.

## Edit the site

| File | Purpose |
| --- | --- |
| `_config.yml` | Profile, contact details, and site URL |
| `index.html` | About, Education, and section order |
| `_data/publications.yml` | Papers, authors, equal contributions, venues, images, and links |
| `_includes/publication.html` | One reusable paper component |
| `_layouts/default.html` | Profile sidebar and page shell |
| `assets/css/style.css` | All styling and responsive layout |
| `images/` | Profile photo and paper thumbnails |
| `files/CV.pdf` | Downloadable CV |

Publications follow YAML order. Author names matching `title` in the site configuration are bolded; `equal_contribution: true` adds an asterisk. Content is stored once, separately from presentation.

`cv.html` and `publications.html` preserve existing URLs using `_layouts/redirect.html`. Internal image, stylesheet, and redirect URLs support an optional `baseurl`.

## Build and preview

The Gemfile declares only Jekyll 3.10 and WEBrick (the preview server). Jekyll installs its own transitive dependencies. Keep `Gemfile.lock` in Git for reproducible local builds. Jekyll's version matches this site's existing GitHub Pages runtime.

This Mac already has Homebrew Ruby 3.1.7:

```bash
export PATH="/opt/homebrew/opt/ruby@3.1/bin:$PATH"
bundle config set --local path vendor/bundle
bundle install
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
scripts/jekyll-serve.sh
```

Other environments can select a compatible Ruby through a version manager. The preview script uses Homebrew Ruby when available, otherwise PATH. Stop it with Ctrl-C; it does not search for or terminate other projects' servers.

```bash
scripts/jekyll-serve.sh --port 4007
JEKYLL_LIVERELOAD=1 scripts/jekyll-serve.sh
```

`_site/` is generated output; `vendor/` and `.bundle/` are local dependencies/settings. `.omc/` and `For_Codex_Sources/` hold local assistant state and personal reference materials. All are ignored; development files and reference materials are excluded from the published site.

## Branches and deployment

- Remote: `https://github.com/zf0827/zf0827.github.io.git`
- Site: `https://zf0827.github.io/`
- `minimal-template`: the self-contained site and latest content.
- `master`: untouched legacy branch. The future redesign will start from this cleaned site or a blank implementation.

As checked on 2026-09-29, GitHub Pages publishes the root of `minimal-template`; the repository default branch is `master`. Changing the default branch alone does not change Pages' source.

`theme: null` explicitly disables Pages' theme fallback. The homepage names its layout directly and uses only built-in Jekyll/Liquid features. This cleanup requires no deployment setting changes. A later switch to the redesigned `master` should explicitly update the Pages source.
