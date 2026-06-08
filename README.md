# seismoseo.github.io

Personal academic website of **Min-Seong Seo** — built with the
[al-folio](https://github.com/alshedivat/al-folio) Jekyll theme and deployed
automatically to GitHub Pages.

Live site: https://seismoseo.github.io

## Editing the site

| What | Where |
|------|-------|
| Bio / about page | `_pages/about.md` |
| Profile photo | `assets/img/prof_pic.jpg` |
| Name, links, site settings | `_config.yml` |
| Social links (email, GitHub, Scholar, ORCID) | `_data/socials.yml` |
| Publications | `_bibliography/papers.bib` |
| CV content | `_data/cv.yml` (+ PDF at `assets/pdf/cv.pdf`) |
| Blog posts | `_posts/YYYY-MM-DD-title.md` |
| News snippets (about page) | `_news/` |
| Accent color | `_sass/_themes.scss` |

## How it deploys

Every push to `main` triggers the **Deploy site** GitHub Action
(`.github/workflows/deploy.yml`), which builds the site and publishes it to the
`gh-pages` branch. GitHub Pages serves from `gh-pages`.

No local toolchain is required to publish — just edit files and push:

```bash
git add -A && git commit -m "Update content" && git push
# live in ~2 minutes
```

## Local preview (optional, for design work)

To see changes instantly before pushing, preview locally. This machine (RHEL 8,
glibc 2.28) can't use the official Docker path, so we use a userspace conda env
(no root needed). **One-time setup:**

```bash
mamba create -y -n homepage -c conda-forge \
  "ruby>=3.2,<3.4" "nodejs>=20" imagemagick compilers make pkg-config \
  zlib libxml2 libxslt libiconv
mamba run -n homepage gem install bundler -v 4.0.6
mamba run -n homepage bash -c '
  bundle _4.0.6_ config set --local path vendor/bundle
  bundle _4.0.6_ config set --local force_ruby_platform true   # el8: compile gems from source
  bundle _4.0.6_ install'
```

`force_ruby_platform` is required on RHEL 8 — the prebuilt `nokogiri`/`ffi` gems
need glibc 2.29, which this OS doesn't have, so we build them from source instead.

**Then, every time you want to preview:**

```bash
./serve.sh            # http://localhost:4000 with live reload
```

Edit a file, save, and the browser refreshes automatically. Press Ctrl-C to stop.
Note: adding a Jupyter-notebook blog post would additionally require
`mamba install -n homepage -c conda-forge jupyter nbconvert`.
