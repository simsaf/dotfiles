#!/bin/dash

SUCCESS_CHECK() {
	grep "\[{\"success\":true}\]" 1>/dev/null
}

MOVE_TO_END() {
	if [ -n "$1" ]
	then
		i3-msg rename workspace "$1" to "$BUF" 2>&1 | SUCCESS_CHECK
		i3-msg rename workspace "$BUF" to "$1" 2>&1 | SUCCESS_CHECK
	fi
}

WS_LIST="$(i3-msg -t get_workspaces | jq -r '.[] .name')"

BUF="?"
bool=true

while $bool
do
	BUF="${BUF}?"
	bool=false
	for WS_NAME in $WS_LIST
	do
		[ "$BUF" = "$WS_NAME" ] && bool=true
	done
done

WS_CUR_NAME=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')
WS_NEXT_TO_MOVE=false

case "$1" in
	prev)	for WS_NAME in $WS_LIST
			do
				if [ "$WS_CUR_NAME" = "$WS_NAME" ]
				then
					MOVE_TO_END "$WS_CUR_NAME"
					[ -z "$WS_PREV_NAME" ] && exit 0 # циклическое переключение
					MOVE_TO_END "$WS_PREV_NAME"
				else
					WS_PREV_NAME="$WS_NAME"
					MOVE_TO_END "$WS_NAME"
				fi
			done ;;
	next)	for WS_NAME in $WS_LIST # багфича: циклическое переключение
			do
				if $WS_NEXT_TO_MOVE
				then
					MOVE_TO_END "$WS_NAME"
					MOVE_TO_END "$WS_CUR_NAME"
					WS_NEXT_TO_MOVE=false
				elif [ "$WS_CUR_NAME" = "$WS_NAME" ]
				then
					WS_NEXT_TO_MOVE=true
				else
					MOVE_TO_END "$WS_NAME"
				fi
			done ;;
		
	begin)	for WS_NAME in $WS_LIST
			do	
				if [ "$WS_CUR_NAME" = "$WS_NAME" ]
				then
					echo "$WS_NAME already at begining"
				else
					MOVE_TO_END "$WS_NAME"
				fi
			done ;;
	end)	MOVE_TO_END "$WS_CUR_NAME" ;;
esac
