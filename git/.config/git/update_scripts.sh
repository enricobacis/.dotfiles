#!/bin/bash

BASEDIR=$(dirname "$0")
echo "BASEDIR = ${BASEDIR}"

echo '[Updating diff-highlight]'
wget -q 'https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight' -O "${BASEDIR}/diff-highlight"
chmod a+x "${BASEDIR}/diff-highlight"

echo '[Updating diff-so-fancy]'
wget -q 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/diff-so-fancy' -O "${BASEDIR}/diff-so-fancy"
chmod a+x "${BASEDIR}/diff-so-fancy"
