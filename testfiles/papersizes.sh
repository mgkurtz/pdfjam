papersize() {
	echo "=== $1 ==="
	eval "PATH='$1:$PATH' ./pdfjam --help" \
		| sed -n 's/^ *\[Default for you at this site: \(paper.*\)\]/\1/p'
}

if [ -f ~/.pdfjam.conf ]; then
	mv ~/.pdfjam.conf ~/.pdfjam.conf.back
	trap 'mv ~/.pdfjam.conf.back ~/.pdfjam.conf' EXIT
else
	trap 'rm ~/.pdfjam.conf' EXIT
fi
echo 'paper=
papersize=' >~/.pdfjam.conf

# default with libpaper uninstalled
papersize

# libpaper1
papersize mock/paperconf/a5
papersize mock/paperconf/a10
papersize mock/paperconf/letter
papersize mock/paperconf/halfletter

# libpaper2
papersize mock/paper/a5
papersize mock/paper/a10
papersize mock/paper/letter
papersize mock/paperconf/halfletter

# prefer libpaper2
papersize mock/paper/letter:mock/paperconf/a10
papersize mock/paper/a10:mock/paperconf/a10

# ... unless its output is garbage
papersize mock/paper/foo:mock/paperconf/a5
papersize mock/paper/foo:mock/paperconf/a10

# default with malfunctional libpaper installed
papersize mock/paperconf/foo
papersize mock/paper/foo
papersize mock/paper/foo:mock/paperconf/foo

# with config
echo ===== Using config =====
echo paper=a5paper|tee ~/.pdfjam.conf
papersize
papersize mock/paper/letter

echo ===== Using config =====
echo papersize=10cm,30cm|tee ~/.pdfjam.conf
papersize
papersize mock/paper/letter

echo ===== Using config =====
echo 'paper=a5paper
papersize=10cm,30cm'|tee ~/.pdfjam.conf
papersize
papersize mock/paper/letter
