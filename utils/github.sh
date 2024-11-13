#!/bin/sh
## Run by l3build release which runs build.sh first
set -e
[ -n "$1" ] || { echo "Usage: $0 version"; exit 1; }
cd "$(dirname "$0")/../build"
version="$1"

mkdir -p release
rm -fr pdfjam-$version
ln -Ts pdfjam pdfjam-$version
zip -r release/pdfjam-$version.zip pdfjam-$version
tar -cvhzf release/pdfjam-$version.tar.gz pdfjam-$version
gh release create v$version --title "Release v$version" --notes-from-tag pdfjam-$version.zip pdfjam-$version.tar.gz
