#!/bin/bash

BASEDIR=$(dirname "$0")
echo "BASEDIR = ${BASEDIR}"

echo '[Updating diff-so-fancy]'
wget -q 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy' -O "${BASEDIR}/diff-so-fancy"
chmod a+x "${BASEDIR}/diff-so-fancy"

echo '[Updating git-latexdiff]'
wget -q 'https://gitlab.com/git-latexdiff/git-latexdiff/raw/master/git-latexdiff' -O "${BASEDIR}/git-latexdiff"
chmod a+x "${BASEDIR}/git-latexdiff"
