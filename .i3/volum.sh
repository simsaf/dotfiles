#!/bin/dash
case "$*" in
	+)	amixer -q set Master 5%+;;
	-)	amixer -q set Master 5%-;;
	=)	percent=`\
		echo "0\n10\n20\n30\n40\n50\n60\n70\n80\n90\n100" \
		| dmenu -p volume`
		amixer -q set Master ${percent}% unmute;;
esac
echo "v" > ~/.i3/ind_fifo
#echo "Volume:$(amixer get Master | sed -n '$s/.*\[\([0-9%]*\)\].*/\1/p')" > ~/.i3/ind_fifo
echo "Volume:$(amixer get Master | grep -o "[0-9]\{1,3\}%")" > ~/.i3/ind_fifo

pkill -SIGRTMIN+10 i3blocks
exit
