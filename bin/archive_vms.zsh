#!/usr/bin/env zsh

archive_path="/Volumes/GoogleDrive/My Drive/Archival/VMs"
dmg_filename="$(date "+%Y-%m-%d") Virtual Machines.dmg"
out_path="$archive_path/$dmg_filename"

archive_fusionvm "$HOME/Virtual Machines" "$out_path"
