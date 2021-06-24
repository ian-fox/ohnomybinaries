#!/bin/sh

if [[ "$#" -ne 1 && "$#" -ne 2 ]]; then
  echo "Usage: $0 <target> [output_file]"
  exit 1
fi

xxd -p -c 1 $1 | xargs printf "\\\\\\\\x%s" | fold | xargs printf "echo -e -n '%s' >> /tmp/$1\n" > ${2:-commands_$1.sh}

