#!/bin/dash
# TODO line_size = 32
# TODO VERT_BAR vol battery mem swap disk /home cpu term
# TODO %b ESCAPE_VAR
# TODO youtube-dl; echo $! > yt.pid ; kill $(cat yt.pid) а лучше tmux или ncurses
# TODO i3wsbar skb > ind_fifo
#============================== SOM_VARS ==============================={{{
BAT0="" #
BAT1="" #
BAT2="" #
BAT3="" #
BAT4="" #
BAT5="" #
PIC_PROC=""
SEP="໌" #"
SEPL=""
SEPR=""
#COL_END='\033[0m\033[u'
COL_END='\033[0m'
COL_RED='\033[31m'
COL_GRN='\033[32m'
COL_NRM='\033[37m'
COL_BLK='\033[30m'
COL_GRY='\033[90m'
COL_GRN_URG='\033[30;48;5;46m'
#ESC_POS='\033[s\033[0;'
ESC_POS='\033[0;'
#=======================================================================}}}
#============================== FUNCTIONS =============================={{{
VERT_BAR(){
	case "$1" in
		*X)			printf "▕╳▏";;
		100*)		printf "▕█▏";;
		9[0-9]*)	printf "▕█▏";;
		8[0-9]*)	printf "▕▇▏";;
		7[0-9]*)	printf "▕▆▏";;
		6[0-9]*)	printf "▕▅▏";;
		5[0-9]*)	printf "▕▄▏";;
		4[0-9]*)	printf "▕▃▏";;
		3[0-9]*)	printf "▕▂▏";;
		2[0-9]*)	printf "▕▁▏";;
		1[0-9]*)	printf "▕▁▏";;
		[0-9]*)		printf "▕ ▏";;
	esac
}
OUNTER(){
	RES="$(echo "$*" | sed -n 's/\[[0-9;]\+[mH]//g;p')" # | wc -m
	echo ${#RES}
}
COUNTER(){
	RES="$(echo "$*" | sed -n 's/\[[0-9;]\+[mHsu]//g;p' | wc -m)"
	echo ${RES}
}
CAPS_PRINT(){
	fun_led="$(xset -q | sed -n '/LED/s/.*\(.\)$/\1/p')"
	case "$fun_led" in
		0)	CAPS_CONT="$COL_NRM$SEP CAPS $SEP";;
		1)	CAPS_CONT="$COL_GRN_URG$SEPL CAPS $SEPR";;
	esac
	printf "%b%dH%b%b" "$ESC_POS" "$CAPS_POS" "$CAPS_CONT" "$COL_END"
}
AMIXER_PRINT(){
	VOL_PERC="$(amixer get Master | sed -n '$s/.*\[\([0-9%]*\)\].*/\1/p')"
	case "$VOL_PERC" in
		0%)			VOL_PERC="${VOL_PERC}X"
		  			vol="";;
		[1-9]%)		vol="";;
		[1-2]?%)	vol="";;
		[3-5]?%)	vol="";;
		[6-9]?%)	vol="";;
		*)			vol="";;
	esac
	vol=""
	printf "%b%dH%s%s%b" "$ESC_POS" "$AMIXER_POS" "$SEP $vol" "$(VERT_BAR $VOL_PERC)" "$COL_END"
	#printf "\033[0;%dH%s%4s" "$AMIXER_POS" "VOL:" "$VOL_PERC"
}

DATE_PRINT(){
	NOW_TIME="$(date "+ %H:%M ")"
#	if [ ${NOW_TIME%:} -eq 0 ]
#	then
#	WEEK_DAY="$(date "+%u")"
#   	| tr '1234567' 'ӰӱӲӳӴӵӶ' | less)"
#
	WEEK_DAY=""
	TODAY_DATE="$(date "+ %a %d.%m.%y ")"
	printf "%b%dH%s%s%s\033[90m%s\033[0m\033[100m%s%b" "$ESC_POS" "$DATE_POS" "$SEP"\
		"$WEEK_DAY" "$TODAY_DATE" "$SEPR" "$NOW_TIME" "$COL_END"
}

NET_PRINT(){
	NET_DEV="$(grep -om1 "$(ls /sys/class/net)" /proc/net/route 2> /dev/null)"
	#NET_IP="$(grep -om1 "192.168.[0-9]\{1,3\}.[1,3-9][0-9]\{0,2\}$" /proc/net/fib_trie )"
	NET_IP="$(printf "%-14s" "$(ip route get 1 2> /dev/null | cut -d\  -f 7)")"

	if [ "$NET_DEV" = "wlp2s0" ]; then
		SSID="$( iw wlp2s0 info | sed -n '/ssid/s/^.*ssid \(.*\)$/\1/p')"
		QUALITY=$(grep $NET_DEV /proc/net/wireless | cut -d\  -f 5 ) # awk '{ print int($3 * 100 / 70) }')
		case $QUALITY in
			[6-7]?.)	SIGN=" ";;
			[4-5]?.)	SIGN=" ";;
			[2-3]?.)	SIGN="  ";;
			[1\ ]?.)	SIGN="  ";;
#			[6-7]?.)	SIGN="⣠⣾ ";;
#			[4-5]?.)	SIGN="⣠⡆ ";;
#			[2-3]?.)	SIGN="⣠  ";;
#			[1\ ]?.)	SIGN="⡀  ";;
		esac
	fi
	case $NET_DEV in
		#wlp2s0)	NET_DEV="";; #   #
		wlp2s0)	NET_DEV="$(printf "%-9.9s%-3s" "$SSID"   "$SIGN")";;
		enp1s0)	NET_DEV="$(printf "%-9.9s%-3s" "LAN-NET" "  ")";;
		enp*)	NET_DEV="$(printf "%-9.9s%-3s" "USB-MOB" "  ")";;
	esac

	if [ -z "$NET_DEV" ]
	then
		COLOR="\033[31m" RES="---------net down---------"
	else
		if ping -c1 ya.ru 2>/dev/null 1>/dev/null
		then
			COLOR="\033[32m"
		else
			COLOR="\033[33m"
		fi
		RES="$NET_DEV$NET_IP"
	fi

	printf "%b%sH%s%b%s%b%s" "$ESC_POS" "$NET_POS" "$SEP" "$COLOR" " $RES" "$COL_END" " $SEP"
}

LANG_PRINT(){
	case "$1" in
		Eng)	
	printf "%b%dH\033[30;47m${SEPL}\033[37;44m\033[31;47m\033[0;37;40m${SEPL}%b" "$ESC_POS" "$LANG_POS" "$COL_END"
#	printf "%b%dH%s" "$ESC_POS" "$LANG_POS" "$(cat ~/.i3/br_flag.six)"
			;;
		Rus)	
	printf "%b%dH\033[30;41m${SEPL}\033[38;5;226m☭  \033[30m${SEPR}%b" "$ESC_POS" "$LANG_POS" "$COL_END"
			;;
	esac
#	printf "\033[0;%dH%s %s" "$LANG_POS" "$SEP" "$1"
#  #
#  #
}
MKB_LINE_PRINT(){
	case "$1" in
		YouTube:*)	MKB_LAB="\033[1;31;40m    "
			#yt*)	MKB_LAB="\033[30;41m${SEPL}\033[37m\033[30m${SEPR}"
					MKB_START="\033[1;31m"
					MKB_SEP="━\033[1;30m"
					MKB_CONT="${1#YouTube:}";;
		Volume:*)	MKB_START="\033[1;37m"
					case "$1" in
						*:0%)		MKB_START="\033[1;30m"
									vol="";;
						*:[1-9]%)	vol="";;
						*:[1-2]?%)	vol="";;
						*:[3-5]?%)	vol="";;
						*:[6-9]?%)	vol="";;
						*)			vol="";;
					esac
					MKB_LAB="\033[30;47m${SEPL}${vol}${SEPR}"
					MKB_SEP="┫\033[1;30m"
					MKB_CONT="${1#Volume:}";;
		*:*)		MKB_LAB="\033[30;44m${SEPL}${SEPR}"
					MKB_START="\033[1;34m"
					MKB_SEP="━\033[1;30m"
					MKB_CONT="${1#*:}";;
	esac
	printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5))" "$MKB_LAB" "$COL_END"
	printf "%b%dH%b%b" "$ESC_POS" "$LINE_POS" "$(SIZE=32 SEP="$MKB_SEP" START="$MKB_START" mkb $MKB_CONT)" "$COL_END"
	#MKB_GET="$(SIZE=32 CHAR1='━' CHAR2='━' SEP='╋[1;30m' START='[1;37m' END='[0m' mkb $1)"
}
SKROLL_LINE_PRINT(){
(
	case "$1" in
		YouTube:*)	NOT_CLOSE="1"
					SKR_LAB="\033[1;31;40m    ";;
		ZXTune:*)	SKR_LAB="\033[30;42m${SEPL}${SEPR}";;
		MOCP:*)		SKR_LAB="\033[30;44m${SEPL}${SEPR}";;
		MPD:*)		SKR_LAB="\033[30;44m${SEPL}${SEPR}";;
		*\ \-\ *)	SKR_LAB="\033[30;47m${SEPL}${SEPR}";;
		*)			SKR_LAB="\033[30;44m${SEPL} ${SEPR}";;
	esac
	for ix in `seq 1 32`;
	do
		sleep 0.02
		printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5+32-ix))" "$SKR_LAB" "$COL_END"
		printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5+32-ix+5))" " " "$COL_END"
	done
	echo "$1" | skroll -n 32 -d 0.07 -r | while IFS= read line;
	do
		printf "%b%dH%s%b" "$ESC_POS" "$LINE_POS" "$line" "$COL_END"
	done
	#[ "$NOT_CLOSE" = "1" ] && return 0
	for ix in `seq 0 32`;
	do
		sleep 0.02
		printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5+ix))" "$SKR_LAB" "$COL_END"
		printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5+ix-1))" " " "$COL_END"
	done
) & SKROLL_LINE_PID=$!
}
RELOAD(){
	i3-msg '[class="stbar"] kill; exec ~/.i3/start_stbar.sh '
#	DATE_PRINT
#	AMIXER_PRINT
#	CAPS_PRINT
#	#LANG_PRINT "$(skb -1)"
#	NET_PRINT
#	BAT_PRINT
}
W3MIMG_PRINT() {
  echo -ne "
2;
3;
0;1;0;0;0;0;0;0;0;0;$1
4;
3;
5;$1" | /usr/lib/w3m/w3mimgdisplay > /dev/null
}
IMG_PRINT() {
	printf "\033[0;0H"
	img2sixel $1
}
SIX_PRINT() {
	printf "\033[0;0H%s" "$(cat $1)"
}
BAT_PRINT(){
	BAT_PERC="$(cat /sys/class/power_supply/BAT1/capacity)"
	case "$BAT_PERC" in
		[8-9]?|100)	BAT_COL="42;30"   BAT_IND="$BAT1";;
		[6-7]?)		BAT_COL="42;30"   BAT_IND="$BAT2";;
		[3-5]?)		BAT_COL="43;30"   BAT_IND="$BAT3";;
		[1-2]?)		BAT_COL="41;30"   BAT_IND="$BAT4";;
			?)		BAT_COL="41;30" BAT_IND="$BAT5";;
	esac
	BAT_STAT="$(cat /sys/class/power_supply/BAT1/status)"
	case "$BAT_STAT" in
		Full)	BAT_COL="48;5;8;30" BAT_IND="$BAT0";;
		#SEPL="$SEP" SEPR="$SEP";;
		Charging)	BAT_IND="$BAT0";;
		Unknown)	BAT_IND="$BAT0";;
	esac
	printf "%b%dH\033[${BAT_COL}m%s%s%s%b" "$ESC_POS" "$BAT_POS" "$SEPL" "$BAT_IND" "$SEPR" "$COL_END"
}
YOUTUBE_DL(){
	[ -s ~/.i3/yt-dl-list ] && echo "$1" >> ~/.i3/yt-dl-list && return 0
	echo "$1" >> ~/.i3/yt-dl-list
	SKROLL_LINE_PRINT "YouTube: WAIT..."
	while [ -s ~/.i3/yt-dl-list ]
	do
		FILE="$(head -n1 ~/.i3/yt-dl-list)"
		(
			youtube-dl --newline "$FILE" 2>> ~/errlog \
			| tee ~/.i3/yt-dl-now \
			| grep -o --line-buffered "Movies/.*.mp4.*\|[0-9.]\{1,5\}%" \
			| while read line; do echo "YouTube:${line#Movies/}" > ~/.i3/ind_fifo ; done
		) || ( cat ~/.i3/yt-dl-list >> ~/.i3/yt-dl-list-old && rm ~/.i3/yt-dl-list )
		echo "YouTube: Done" > ~/.i3/ind_fifo
		sed -i '1d' ~/.i3/yt-dl-list
		[ -z "$(head -n1 ~/.i3/yt-dl-list)" ] && rm ~/.i3/yt-dl-list
	done 2>> ~/errlog  &
}
MOUSE_LED(){
	case "$1" in
		hhpcA*)	MOUSE_LAB="\033[30;45m${SEPL}${SEPR}";;
		hhpcB*)	MOUSE_LAB="\033[30;46m${SEPL}${SEPR}";;
	esac
	printf "%b%dH%b%b" "$ESC_POS" "$((LINE_POS-5+32))" "$MOUSE_LAB" "$COL_END"
}

#=======================================================================}}}
#============================== POS_VARS ==============================={{{
	COLS="$(tput cols)"                                     ;  PREV_POS=$COLS
	DATE_POS="$((PREV_POS-$(COUNTER $(DATE_PRINT))+3))"     ;  PREV_POS=$DATE_POS
	#STAT_POS="$((PREV_POS-$(COUNTER $(STAT_PRINT))))"      ;  PREV_POS=$STAT_POS
	STAT_POS="$((PREV_POS-7))"                              ;  PREV_POS=$STAT_POS
	AMIXER_POS="$((PREV_POS-$(COUNTER $(AMIXER_PRINT))+1))"   ;  PREV_POS=$AMIXER_POS
#	CAPS_POS="$((PREV_POS-$(COUNTER $(CAPS_PRINT))+2))"     ;  PREV_POS=$CAPS_POS
	LANG_POS="$((PREV_POS-$(COUNTER $(LANG_PRINT))-6))"     ;  PREV_POS=$LANG_POS
#	BAT_POS="$((PREV_POS-$(COUNTER $(BAT_PRINT))+1))"       ;  PREV_POS=$BAT_POS
#	NET_POS="$((PREV_POS-$(COUNTER $(NET_PRINT))))"         ;  PREV_POS=$NET_POS
	NET_POS="$((PREV_POS-32))"                              ;  PREV_POS=$NET_POS
	BAT_POS="$((PREV_POS-5))"                               ;  PREV_POS=$BAT_POS
#	LED_POS="$((PREV_POS-$(COUNTER $(LED_PRINT))))"         ;  PREV_POS=$LED_POS
	#LINE_POS="$((PREV_POS-$(COUNTER $(LINE_PRINT))))"      ;  PREV_POS=$LINE_POS
	LINE_POS="$((PREV_POS-32))"                             ;  PREV_POS=$LINE_POS
#=======================================================================}}}
#LOGO_PRINT
DATE_PRINT
AMIXER_PRINT 2>>~/err
#CAPS_PRINT 2>>~/err
#LANG_PRINT "$(skb -1)"
NET_PRINT 2>>~/err
BAT_PRINT 2>>~/err
setterm -cursor off

tail -f ~/.i3/ind_fifo | while read led;
do
	case $led in
		*.jpg)				IMG_PRINT "$led";;
		*.six)				SIX_PRINT "$led";;
		1)					LED_PRINT c;;
		e)					LED_PRINT p;;
		b)					BAT_PRINT;;
		n)					NET_PRINT 2>>~/err;;
		r)					RELOAD ;;
		q)					exit ;;
		l)					LINE_PRINT ;;
#		c)					CAPS_PRINT ;;
		v)					AMIXER_PRINT ;;
		hhpc[AB]:*)			MOUSE_LED "$led";;
		http*youtu*)		YOUTUBE_DL "$led" ;;
		*youtube.com/*)		YOUTUBE_DL "$led" ;;
		Eng|Rus)			LANG_PRINT "$led";;
		[a-zA-Z]*:[0-9]*%)	MKB_LINE_PRINT $led;;
		[a-zA-Zа-яА-Я]*)	SKROLL_LINE_PRINT "$led" ;;
	esac
		#new_led="$new_led $led"
		#SKROLL_LINE_PRINT "$new_led"
done &

~/.i3/i3-wsbar.pl &
skb | while read -r i; do echo "$i" > ~/.i3/ind_fifo; done & #printf "\033[0;%dH%s %s" "$LANG_POS" "$SEP" "$i"
#hhpc -i 3 | while read -r i; do echo "$i" > ~/.i3/ind_fifo; done &

TIME=0
while true
do
	[ $((TIME%6)) -eq 0 ] && TIME=0
	[ $((TIME%1)) -eq 0 ] && NET_PRINT 2>>~/err
	[ $((TIME%3)) -eq 0 ] && BAT_PRINT 2>>~/err
	[ $CORR_DATE ] || CORR_DATE=$(sleep $((60-$(date +%-S))); echo 1)
	[ $((TIME%5)) -eq 0 ] && DATE_PRINT
	sleep 10
	TIME=$((TIME+1))
done &
#wendy -m32 -t5 -f /sys/class/power_supply/BAT1/uevent echo b |\ while read -r i ; do echo "b" > ~/.i3/ind_fifo; done &
#wendy -m32 -t5 -f /sys/class/net echo n |\ while read -r i ; do echo "n" > ~/.i3/tind_fifo; done &
vmstat 3 -a -n | while read -r r  b  swpd  free  buff  cache  si  so  bi  bo  in  cs  us  sy  id  wa  st;
	#1  2  3     4     5     6      7   8   9   10  11  12  13  14  15  16  17
	#r  b  swpd  free  buff  cache  si  so  bi  bo  in  cs  us  sy  id  wa  st;
	do
		[ "$r" = "procs" ] && continue
		[ "$r" = "r" ] && continue
		printf "%b%dH%s %s%3s%b" "$ESC_POS" "$STAT_POS" "$SEP" "$PIC_PROC" "$(VERT_BAR $((100-id))%)" "$COL_END"
#  #
#{{{		printf "\033[0;%dH%s %d" " 1" "|" "$r"
#		printf "\033[0;%dH%s %d" " 5" "|" "$b"
#		printf "\033[0;%dH%s %d" "11" "|" "$swpd"
#		printf "\033[0;%dH%s %d" "15" "|" "$free"
#		printf "\033[0;%dH%s %d" "21" "|" "$buff"
#		printf "\033[0;%dH%s %d" "25" "|" "$cache"
#		printf "\033[0;%dH%s %d" "31" "|" "$si"
#		printf "\033[0;%dH%s %d" "35" "|" "$so"
#		printf "\033[0;%dH%s %d" "41" "|" "$bi"
#		printf "\033[0;%dH%s %d" "45" "|" "$bo"
#		printf "\033[0;%dH%s %d" "51" "|" "$in"
#		printf "\033[0;%dH%s %d" "55" "|" "$cs"
#		printf "\033[0;%dH%s %d" "61" "|" "$us"
#		printf "\033[0;%dH%s %d" "65" "|" "$sy"
#		printf "\033[0;%dH%s %d" "71" "|" "$id"
#		printf "\033[0;%dH%s %d" "75" "|" "$wa"
#}}}		printf "\033[0;%dH%s %d" "81" "|" "$st"
done 2> /dev/null &
#zsh
#tmux

ANSW_NUM=0
while true
do
	old=$(stty -g)
	stty raw -echo min 1
	ANSW=$(dd bs=1 count=1 2>/dev/null)
	stty $old
	[ "$ANSW" = "$ANSW_OLD" ]
	[ "$ANSW" = "" ] && ANSW_NUM="-2"
	[ "$ANSW" = ";" ] && ANSW_NUM="-3"
	[ "$ANSW" = "r" ] && ANSW_NUM="r"
	echo ":$ASW :" >> ~/log
	case $ANSW_NUM in
		-[0-9])	;;
		0)		;;
		1)		echo "Поаккуратней" > ~/.i3/ind_fifo;;
		2)		echo "Че надо?" > ~/.i3/ind_fifo;;
		3)		echo "Отстань" > ~/.i3/ind_fifo;;
		4)		echo "РУКИ УБЕРИ!!!" > ~/.i3/ind_fifo;;
		5)		echo "РУКИ ПРОЧЬ!!!" > ~/.i3/ind_fifo;;
		6)		echo "РУКИ!!!" > ~/.i3/ind_fifo;;
		7)		echo "РУКИ Я СКАЗАЛ!!!" > ~/.i3/ind_fifo;;
		8)		echo "ПШЕЛ отседа" > ~/.i3/ind_fifo;;
		9)		echo "КЫШЬ!!!" > ~/.i3/ind_fifo;;
		10)		echo "Брысь!!!" > ~/.i3/ind_fifo;;
		11)		echo "Прекращай" > ~/.i3/ind_fifo;;
		12)		echo "Прекращай" > ~/.i3/ind_fifo;;
		13)		echo "Прекращай" > ~/.i3/ind_fifo;;
		14)		echo "Прекращай" > ~/.i3/ind_fifo;;
		15)		echo "Прекращай" > ~/.i3/ind_fifo;;
		16)		echo "Прекращай" > ~/.i3/ind_fifo;;
		17)		echo "Прекращай" > ~/.i3/ind_fifo;;
		r)		echo "r" > ~/.i3/ind_fifo
				ANSW_NUM=0;;
		q)		echo "q" > ~/.i3/ind_fifo
				ANSW_NUM=0;;
		*)		continue;;
	esac
	ANSW="$ANSW_OLD"
	[ $ANSW_NUM -ge 0 ] && i3-msg focus mode_toggle 2> /dev/null > /dev/null
	ANSW_NUM="$((ANSW_NUM+1))"
done

#xev -root -event keyboard | while read i; do
#	i="$(echo "$i" | cut -d\  -f 23-26)"
#	if [ "$i" = "0   4" ]; then
#		CAPS_PRINT
#	fi
#	if [ "$i" = "16  0 " ] || [ "$i" = "8   0" ]; then
#		AMIXER_PRINT
#	fi
#done &
#printf "\033[0;%dH %s %s" "$STAT_POS" "$SEP" "$(OUNTER `DATE_PRINT`) $(COUNTER `DATE_PRINT`)"

