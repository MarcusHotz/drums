---
title: README
author: Marcus Hotz
date: 2020-01-21
---

TODO: **makefile, install, requirements (lilypond, eisvogel, imagemagick...), .gitignore**

# Lilypond to PNG

```shell
$ lilypond --png drum01.ly && convert drum01.png -trim ../.docs/drum01.png && rm *.png

```

# PDF generation

```shell
$ pandoc README.md -o pdf/README.pdf --standalone --template eisvogel -f markdown \\
&& evince README.pdf

```

**TODO: NEW Document** `20200121_3-rudiments.md`

# 3 Rudiments

## Singles

![Übung 1](.docs/20200121_3-rudiments_u01.png)

## Doubles

![Übung 2](.docs/20200121_3-rudiments_u02.png)

## Paradiddle

![Übung 3](.docs/20200121_3-rudiments_u03.png)

