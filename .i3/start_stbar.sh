#!/bin/dash
SCR_WIDTH=$((`xrandr | grep current | cut -d\  -f 8`/ 7 ))
#st -c stbar -g 182x1 -i -e ~/.i3/stbar.sh
#	 st -e  ~/.i3/stbar.sh
	case "$1" in
		shell*)	st -c stbar -g ${SCR_WIDTH}x1 -i -e zsh 2>> ~/.i3/errlog ;;
		bar*)	st -c stbar -g ${SCR_WIDTH}x1 -i -e ~/.i3/stbar.sh 2>> ~/.i3/errlog ;;
		*)	st -c stbar -g ${SCR_WIDTH}x1 -i -e ~/.i3/stbar.sh 2>> ~/.i3/errlog ;;
	esac
#	 mlterm -g ${SCR_WIDTH}x1 -i -e ~/.i3/stbar.sh 2>> ~/.i3/errlog
