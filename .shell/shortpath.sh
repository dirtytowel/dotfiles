#!/bin/sh
OFS=$IFS
IFS='
'

home=$(echo "$HOME")
pth=$(echo "$PWD" |  sed 's|^/home/[^/]*|~|' )
newpth=""
apa=$(echo "$pth" | tr '\/' '\n' )
for d in $apa; do
  #echo $d
  [ $d = '~' ] && newpth='~' && continue
  # if first char is '.', grab the second
  case $d in
    "."*) d=$(echo "$d" | cut --complement -c1-1 | cut -b1 ); d="/$d" ;;#newpth+=$("$d" | cut -c1-) ;
    *)    d=$(echo "$d"| cut -b1); d="/$d" ;;#newpth+="$d" ;;
  esac
  newpth="${newpth:+${newpth}}${d}"
done
test -z $newpth && newpth="/"; echo $newpth

IFS="$OFS"
