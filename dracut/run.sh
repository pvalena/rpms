#!/usr/bin/zsh

set -e
zsh -n "$0"

[[ '-d' == "$1" ]] && {
  shift
  set -x
  :
}

n="$1"
b="$2"
[[ -n "$n" ]]
[[ -n "$b" ]]

[[ -d "$b" ]] || mkdir "$b"

cd "$b"

[[ "$b" == "$(basename "$PWD")" ]]

rm *.rpm||:

brew download-task "$n"

git add *.rpm

git commit -am "Add rpms for #${b}."

git push

echo OK
