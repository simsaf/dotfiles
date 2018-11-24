#!/bin/dash
LIST="$1"

STRING="$(head -n 1 "$LIST")"
trap 'echo "$STRING # not finished" >> "$LIST"; exit 1' INT
echo "\033[31;1m ${STRING%%\#*} \033[0m\033[34m ${STRING##*\#} \033[0m" >&2
echo "${STRING%%\#*}"
sed -i '1d' "$LIST"
exit 0
