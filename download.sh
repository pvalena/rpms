#!/usr/bin/env zsh

set -xe

zsh -n -c "$0"

b="${1}"
i="${2}"

m="RHEL-${i}"

cd "$(dirname "$(readlink -e "$0")")"

mkdir -p dracut/"${i}"
cd dracut/"${i}"

rm *.rpm ||:

koji -p stream download-task "$b"

gita *.rpm

gitiam "RPMS for ${m}"

gith
gits
