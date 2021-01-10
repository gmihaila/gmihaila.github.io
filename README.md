# George's Documentation Website

## [https://gmihaila.github.io](https://gmihaila.github.io)

## Purpose

Friendly place to keep up to date documentations for things I find useful.

## What I used

Main page is built with [MkDocs](https://www.mkdocs.org/) and [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/).


## Maintanance

Use as current folder `gmihaila.github.io`:

* Build website and move files:

<!---
mkdocs build --config-file docs/mkdocs.yml
cp -rf docs/site/* .
rm -rf docs/site
-->

  ```bash
  mkdocs build --config-file docs/mkdocs.yml
  cp -rf docs/site/* .
  rm -rf docs/site
  ```

* Push to GitHub:

<!---
git add --all
git commit -m "Updates to Website"
git push origin master
-->

  ```bash
  git add --all
  git commit -m "Updates to Website"
  git push origin master
  ```
  
* All in one:

<!---

mkdocs build --config-file docs/mkdocs.yml
cp -rf docs/site/* .
rm -rf docs/site
git add --all
git commit -m "Updates to Website"
git push origin master

-->

  ```bash
  mkdocs build --config-file docs/mkdocs.yml
  cp -rf docs/site/* .
  rm -rf docs/site
  git add --all
  git commit -m "Updates to Website"
  git push origin master
  ```


