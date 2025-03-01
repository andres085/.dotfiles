#!/usr/bin/env bash

languages=$(echo "golang javascript typescript" | tr " " "\n")
core_utils=$(echo "find cp mv mkdir touch awk sed xargs" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "Insert Query: " query

if echo "$languages" | grep -qs $selected; then
  tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") &
  while [ : ]; do sleep 1; done"
else
  tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
