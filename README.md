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

No local toolchain is required to publish — just edit files and push.
