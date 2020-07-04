# George's Documentation Website

## [https://gmihaila.github.io](https://gmihaila.github.io)

## Purpose

Friendly place to keep up to date documentations for things I find useful.

## What I used

Main page is built with [MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).


## Maintanance

Use as current folder `gmihaila.github.io`:

* Build website and move files:
  ```bash
  mkdocs build --config-file website_mkdocs_project/mkdocs.yml
  cp -rf website_mkdocs_project/site/* .
  rm -rf website_mkdocs_project/site
  ```

* Push to GitHub:

  ```bash
  git add --all
  git commit -m "Updates to Website"
  git push origin master
  ```
  
* All in one:

  ```bash
  mkdocs build --config-file website_mkdocs_project/mkdocs.yml
  cp -rf website_mkdocs_project/site/* .
  rm -rf website_mkdocs_project/site
  git add --all
  git commit -m "Updates to Website"
  git push origin master
  ```


