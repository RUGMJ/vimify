#!/bin/env bash

executable="neovide" # Change this to your own vim binary

temp_file=$(mktemp)

wl-paste -p > "$temp_file"

"$executable" "$temp_file" &

inotifywait -qq -e modify "$temp_file"
cat "$temp_file" | wl-copy

rm "$temp_file"
