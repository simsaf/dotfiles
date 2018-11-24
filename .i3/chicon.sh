#!/bin/dash
WS_LIST="$(xprop -root | grep "NET_DESKTOP_NAMES(UTF8_STRING)" | cut -d= -f 2 | tr -d "\",")"
WS_CURR="$(xprop -root | grep "NET_CURRENT_DESKTOP(CARDINAL)" | cut -d= -f 2 | tr -d \ )"
WS_CUR_NAME="$(echo ${WS_LIST} | cut -d\  -f $((WS_CURR+1)))"
case "$1" in
	web)		WS_NEW_NAME="" ;;
#	web)		WS_NEW_NAME="" ;;
#	vim)		WS_NEW_NAME="" ;;
	vim)		WS_NEW_NAME="" ;;
	music)		WS_NEW_NAME="" ;;
	play)		WS_NEW_NAME=""
				WS_CUR_NAME="" ;;
	pause)		WS_NEW_NAME=""
				WS_CUR_NAME="" ;;
	mplayer)	WS_NEW_NAME="" ;;
	term)		WS_NEW_NAME="_" ;;
#	term)		WS_NEW_NAME="" ;;
	fm)			WS_NEW_NAME="" ;;
	book)		WS_NEW_NAME="" ;;
	vk)			WS_NEW_NAME="" ;;
	tg)			WS_NEW_NAME="" ;;
	autorename)	
		#xprop -id $WINDOWID -f WS_CLASS 8s -set WS_CLASS "vim"
		WIN_CUR="$(xprop -root | grep "NET_ACTIVE_WINDOW(WINDOW): window id # " | grep -o "0x[0-9a-fA-F]\{7\}")"
		WIN_CUR_CLASS="$(xprop -id "$WIN_CUR" | grep "WS_CLASS" | cut -d= -f 2 | tr -d "\",")"
		case "$WIN_CUR_CLASS" in
			*vim*)			$0 vim; exit ;;
			*ncmpcpp*)		$0 music; exit ;;
			*zathura*)		$0 book; exit ;;
			*centerim*)		$0 vk; exit ;;
			*wyeb*)			$0 web; exit ;;
		esac
		WIN_CUR_NAME="$(xprop -id "$WIN_CUR" | grep "WS_NAME" | cut -d= -f 2 | tr -d "\",")"
		case "$WIN_CUR_NAME" in
			*vim*)			$0 vim; exit ;;
			*ncmpcpp*)		$0 music; exit ;;
			*zathura*)		$0 book; exit ;;
			*centerim*)		$0 vk; exit ;;
			*http[s]?://*)	$0 web; exit ;;
		esac
		$0 temp;;
	*)			WS_NEW_NAME=$WS_CUR_NAME
				i3-msg rename workspace $WS_CUR_NAME to temp
				WS_CUR_NAME="temp" ;;
esac
i3-msg rename workspace $WS_CUR_NAME to $WS_NEW_NAME 2>&1 | grep "ERROR" && \
	i3-msg move container to workspace $WS_NEW_NAME
#
#	set $WS7 
#	#      
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
#  #
