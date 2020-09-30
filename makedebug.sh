#!/bin/sh

if test $# -ne 1
then
	echo >&2 "Syntax: $0 <filename>"
	exit 1
fi

cat "$1" |
dgzip -f 2>/dev/null |
dgzip -d -f -v -v 2>&1 1>/dev/null |
sed '1,/^$/d' |
head -n 1 |
sed 's/\\/\n\\/g'
