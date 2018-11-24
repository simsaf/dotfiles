#!/bin/dash
clear
COLS=$(tput cols)
ROWS=$(tput lines)
while true
do
	old="$(stty -g)"
	stty raw -echo min 1
	READ_KEY="$(dd bs=1 count=1 2>/dev/null)"
	stty "$old"
	[ "$READ_KEY" = "" ] && READ_KEY="<ESC>"
	[ "$READ_KEY" = "" ] && READ_KEY="<ENTER>"
	[ "$READ_KEY" = "	" ] && READ_KEY="<TAB>"
	[ "$READ_KEY" = "" ] && READ_KEY="<C-c>"
	[ "$READ_KEY" = "" ] && READ_KEY='' READ_LINE="${READ_LINE%?}"
	[ "$READ_KEY" = "" ] && READ_KEY='' READ_LINE="${READ_LINE%[ _-/=;<>]*}"
	[ "$READ_KEY" = "" ] && READ_KEY='' READ_LINE="${READ_LINE%%*}"
	READ_LINE="$READ_LINE$READ_KEY"

	clear >&2
	while [ $((COLS-i)) -ne 0 ] ; do LINE_BAR="${LINE_BAR}=" ; i=$((i+1)); done
	printf "\033[%d;0H%s\n" "$((ROWS-3))" "$LINE_BAR" >&2
	printf "\033[%d;0H LAST_KEY_IS:$READ_KEY:\n" "$((ROWS-2))" >&2
	printf "\033[%d;0H REGEX_LINE_IS: $READ_LINE\n" "$((ROWS-1))" >&2
	[ "$READ_KEY" = "q" ] && exit 0
	echo "$READ_LINE"
done | \
	while IFS= read COMMAND_LINE
	do
		NLINE=0
		grep -n --line-buffered --color=always "$COMMAND_LINE" $1 2>&1 | \
		while IFS= read TERM_LINE
		do
			NLINE=$((NLINE+1))
			if [ $NLINE -lt $((ROWS-4)) ]
			then
				printf "\033[%d;0H%s" "$NLINE" "$TERM_LINE"
			elif [ $NLINE -eq $((ROWS-4)) ]
			then
				while [ $((COLS-i)) -ne 0 ] ; do LINE_BAR="${LINE_BAR}v" ; i=$((i+1)); done
				printf "\033[%d;0H%s\n" "$((ROWS-4))" "$LINE_BAR"
			fi
		done
	done
