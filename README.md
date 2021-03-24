# George's Documentation Website

## [https://gmihaila.github.io](https://gmihaila.github.io)

## Purpose

Friendly place to keep up to date my personal website with materials I find useful.

## What I used

Main page is built with [MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).

All files needed to build website are under `docs/`.

## Install required packages

```bash
$ pip install -r requirements.txt
```

## Building documentation

Check `$ make help` for more info.

### Rebuild docs automatically and push to github:

```bash
$ make servedocs
```

### Rebuild docs automatically and display locally:

```bash
$ make docs
```
