#!/bin/dash

MENU(){
	for BIN in slmenu dmenu dialog whiptail
	do
		[ -x /bin/$BIN ] && break
	done
	## TODO dialog whiptail and shells read
	case $BIN in
		slmenu)	slmenu -i  -l $(($(tput lines)-2)) ;;
		dmenu)	;;
		*)	exit 1;;
	esac
}

GET_L_NAME() {
	sed -n '1,/^#LAYOUTS/d; s/--off/#off#/g; s/--output/#/g; s/\([A-Z0-9]\) --mode/\1 # #/g; s/--\(primary\) /#\1#/g; s/\(xrandr\|--[a-z]*\)//g; p' $0 |\
		column -t -s '#' |\
		MENU | sed -n 's/^ *\([A-Z0-9]*\) .*/\1/; p'
}

CHOOSE() {
	L_NAME="$(GET_L_NAME)"
	tput clear
	printf "\033[0;0H"
	$(sed -n '/^#'${L_NAME}'/s/^#'${L_NAME}' \(.*$\)/\1/p' $0)
}

NEW() {
	xrandr #TODO
}

RENAME() {
	L_NAME="$(GET_L_NAME)"
	tput clear
	printf "\033[0;0H"
	printf "Type new name (only [A-Z0-9] without spaces)\n"
	read NEW_L_NAME
	sed -i 's/^#'${L_NAME}' /#'${NEW_L_NAME}' /' $0 || exit 2
}

DELETE() {
	L_NAME="$(GET_L_NAME)"
	tput clear
	printf "\033[0;0H"
	printf "Do you really want to remove layout %s (Yn)?\n" "$L_NAME"
	ANSWER="n"
	read ANSWER
	[ "$ANSWER" = "y" ] && sed -i '/^#'${L_NAME}' /d' $0 || exit 2
}

[ -n "$1" ] && $(sed -n '/^#'${1}'/s/^#'${1}' \(.*$\)/\1/p' $0) && exit 0
tput clear
printf "\033[0;0H"
printf " Display layout selecting\n"
ANSWER="$(printf "Choose existing layout\nCreate new layout\nRename\nDelete\nExit" | MENU)"
case $ANSWER in
	Choose*)	CHOOSE;;
	Create*)	NEW;;
	Rename*)	RENAME;;
	Delete*)	DELETE;;
	Exit*)		exit 0;;
	*)			exit 1;;
esac

#LAYOUTS
#PROJ xrandr --output VIRTUAL1 --off --output LVDS1 --primary --mode 1024x600 --pos 0x0 --rotate normal --output VGA1 --mode 1024x768 --pos 0x600 --rotate normal
#BOOK xrandr --output VIRTUAL1 --off --output LVDS1 --mode 1024x600 --pos 0x0 --rotate right --output VGA1 --off
#MINI xrandr --output VIRTUAL1 --off --output LVDS1 --mode 1024x600 --pos 0x0 --rotate normal --output VGA1 --off
#SQUARE xrandr --output VIRTUAL1 --off --output LVDS1 --off --output VGA1 --primary --mode 1280x1024 --pos 0x0 --rotate normal
#SQUAREDUAL xrandr --output VIRTUAL1 --off --output VGA1 --mode 1280x1024 --pos 0x0 --rotate normal --output LVDS1 --mode 1024x600  --pos 0x1024 --rotate normal
#TEST xrandr --output VIRTUAL1 --off --output VGA1 --mode 1280x1024 --pos 0x0 --rotate normal --output LVDS1 --mode 1024x600  --pos 0x1024 --rotate normal
