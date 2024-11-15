* Major version bumped to 4.00 to reflect major refactoring, and some minor backwards-incompatible changes.
* New co-maintainer.
* Several minor bug fixes.
* New option `--build-dir path` to build in `path` instead of a temporary
  directory. Overwrites files in `path` without further notice.
* In the constructed tex file, included files are now referenced as
  `source-1.pdf` etc. instead of `/tmp/pdfjam-XXXXXX/source-1.pdf`.
  This improves reproducibility and allows referencing with hyperref.
* Automatically add braces around values where necessary. Thus, one can now
  write `--papersize 7cm,3cm` and `--picturecommand '\put(20,20){Text}'`.
* Support libpaper1 in addition to libpaper2 to obtain system default paper.
* Support `--paper a4` etc. as alternative to `--paper a4paper`.
* Support `--papersize 595,842` as alternative to `--papersize 595bp,842bp`.
  Prevents people adding unit `pt` where they actually mean `bp`.
* Renames duplex edge flipping options `--longedge` to `--other-edge` and
  `--shortedge` to `--no-other-edge` to reflect their actual behaviour.
* Support `--keepinfo --pdfauthor ''` to discard only the corresponding field
  while keeping the remaining pdfinfo.