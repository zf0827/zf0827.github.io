# Yunxiang Wei — paper-style academic website

A self-contained Jekyll site with no theme, remote theme, custom plugin, or frontend build pipeline. All layout and styling belong to this repository. This is the redesigned master branch, based on the cleaned minimal site.

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

Publications follow YAML order. Author names matching `title` in the site configuration are bolded; `equal_contribution: true` adds an asterisk. Content is stored once, separately from presentation.

`publications.html` preserves the publication entry URL using `_layouts/redirect.html`. CV links, the CV redirect, and the PDF are omitted from this branch. Internal image, stylesheet, and redirect URLs support an optional `baseurl`.

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
- `minimal-template`: preserved clean baseline (f932463), with the previous warm card design.
- `master`: the flat paper design, built from that baseline with the same academic content.
- `archive/master-before-paper-20260929`: recovery tag for legacy master (98a9b11). Its old scaffold is not part of this site.

The production branch is `master`, published from the repository root through GitHub Pages. `minimal-template` is the preserved secondary baseline. Pages source and repository default branch are separate settings.

`theme: null` explicitly disables Pages' theme fallback. The homepage names its layout directly and uses only built-in Jekyll/Liquid features. The publication source is explicitly set to master in GitHub Settings → Pages.

## Design

A single warm-white sheet with a narrow profile column and continuous content.
There is no header navigation, section card, gradient, glass effect, or drop
shadow. Small section numbers, fine rules, and terracotta links provide accents.

Newsreader is used for the name and section headings; DM Sans handles body text
and publication details. Both font files are served locally, with no runtime
request to Google Fonts. Their SIL Open Font Licenses are in assets/fonts/.

Font sources:
- https://github.com/google/fonts/tree/main/ofl/newsreader
- https://github.com/google/fonts/tree/main/ofl/dmsans

The sidebar is sticky on taller desktop viewports and flows normally on compact
screens. The root and body share the paper background and disable vertical
overscroll effects. Native touchpad behavior still needs verification in the
user's browser/OS combination; there is no JavaScript scroll interception.

Paper content remains in _data/publications.yml. On mobile, the profile becomes
compact and the paper entries stack. Keyboard focus, a skip link, image sizes,
font preloads, and a print layout are included.
