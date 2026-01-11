#!/usr/bin/env bash
# Smart window name: [dir if different from session] ❯ [command]

cmd="$1"
path="$2"
session="$3"

dir_name=$(basename "$path")
prefix=""

# Only show directory if it differs from session name
if [ "$dir_name" != "$session" ]; then
    prefix="   $dir_name"
fi

# If it's a shell, just show directory (no chevron/name)
# If it's a program, show chevron and name
case "$cmd" in
    zsh|bash|fish|sh|dash)
        echo "$prefix"
        ;;
    *)
        echo "${prefix} ❯ ${cmd}"
        ;;
esac
