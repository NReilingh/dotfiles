#!/bin/zsh

# Get configuration

# Default to dotfile, override by env var
configPath=${XYZ_METRICONFIG:-~/.xyz_metriconfig}

if [[ -f $configPath ]]; then
  configFile=$(cat $configPath)
else
  print "$configPath is not a file."
  exit 1
fi

# Config is associative array
declare -A config

# f - split by newline, z - parse into words, Q - remove quotes
config=(${(Q)${(z)${(f)configFile}}})

# Split dirs by semicolon
dirs=(${(s/;/)config[dirs]})

machine=$(scutil --get ComputerName)

# InfluxDB Line Protocol
rows=()

for dir in $dirs; do
  dir="${dir/#\~/$HOME}"
  dirname=$(basename $dir)

  # List dir with file flags, filter first line and non-hidden files, and count.
  # dircount=$(ls -lO $dir | awk 'BEGIN { count=0 } NR!=1 && $5!~/hidden/ { count++ } END { print count }')
  # UGH FINALLY

  script=$(<< APPLESCRIPT
tell application "System Events"
  set visibleItems to items of folder "$dir" whose visible = true
  count of visibleItems
end tell
APPLESCRIPT
  )

  dircount=$(osascript -e "$script")

  rows+=("junkDrawerLength,host=$machine,drawer=$dirname items=$dircount")

  # List dir with file flags, sorted by ctime (date of status change, i.e. date added)
  # and including consistent ctime format with year,
  # filter hidden flags, and output date fields from last (oldest) record
  oldestCtime=$(ls -lOtTc $dir | awk '
    NR!=1 && $5!~/hidden/ { date=sprintf("%s %s %s %s", $7, $8, $9, $10) }
    END { print date }')
  # Parse date fields into epoch timestamp and subtract from now to get age
  if [[ $oldestCtime ]]; then
    maxAge=$(( $(date +%s) - $(date -j -f "%b %e %T %Y" $oldestCtime +%s) ))
  else
    maxAge=0
  fi

  rows+=("junkDrawerMaxAge,host=$machine,drawer=$dirname age=$maxAge")
done

if [[ ${#rows[@]} -ne 0 ]]; then
# Request
  curl "${config[apiEndpoint]}" \
     -H "Authorization: Token ${config[apiToken]}" \
     -H 'Content-Type: text/plain; charset=utf-8' \
     -d "${(F)rows}"
fi
