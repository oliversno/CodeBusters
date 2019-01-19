#!/usr/bin/env bash

#Modified from a response by akovia on Stack Overflow https://stackoverflow.com/questions/34376884/highlight-string-differences

# Using stdin input, outputs each char. on its own line, with actual newlines
# in the input represented as literal '\n'.
toSingleCharLines() {
  sed 's/\(.\)/\1\'$'\n''/g; s/\n$/\'$'\n''\\n/'
}

# Using stdin input, reassembles a string split into 1-character-per-line output
# by toSingleCharLines().
fromSingleCharLines() {
  awk '$0=="\\n" { printf "\n"; next} { printf "%s", $0 }'
}

# Prints a colored string read from stdin by interpreting embedded color references
# such as '${RED}'.
printColored() {
  local str=$(</dev/stdin)
  local RED="$(tput setaf 1)" CYA="$(tput setaf 6)" RST="$(tput sgr0)"
  str=${str//'${RED}'/${RED}}
  str=${str//'${CYA}'/${CYA}}
  str=${str//'${RST}'/${RST}}
  printf '%s\n' "$str"
}

# The non-ASCII input string.
strOrg=$1

# Create its ASCII-chars.-only transliteration.
strTransLit=$2

# Print the ORIGINAL string with the characters that NEED transliteration
# highlighted in RED.
diff --changed-group-format='${RED}%=${RST}' \
  <(toSingleCharLines <<<"$strOrg") <(toSingleCharLines <<<"$strTransLit") |
    fromSingleCharLines | printColored

# Print the TRANSLITERATED string with the characters that RESULT FROM
# transliteration highlighted in CYAN.
diff --changed-group-format='${CYA}%=${RST}' \
  <(toSingleCharLines <<<"$strTransLit") <(toSingleCharLines <<<"$strOrg") |
    fromSingleCharLines | printColored
