# ical4j-user-guide

iCal4j user documentation, built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

## Building locally

Install the build dependencies into a virtual environment:

```shell
python3 -m venv .venv
.venv/bin/pip install mkdocs-material mkdocs-redirects
```

Run a strict build (fails on missing nav targets or broken links):

```shell
DISABLE_MKDOCS_2_WARNING=true .venv/bin/mkdocs build --strict
```

Serve the site locally with live reload:

```shell
DISABLE_MKDOCS_2_WARNING=true .venv/bin/mkdocs serve
```

Mermaid diagrams under `docs/images` are regenerated with `make images` (see `Makefile` and `.env`).
