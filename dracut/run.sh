#!/usr/bin/zsh
# ./run.sh BREW_BUILD REF_ISSUE

set -e
zsh -n "$0"

export http_proxy=

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

pwd

rm *.rpm||:

brew download-task "$n"

git add *.rpm

git commit -am "Add rpms for RHEL-${b}."

git push

echo OK
