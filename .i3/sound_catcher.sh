#!/bin/dash

WAIT_TIME=3
SET_SND=30
MAX_LVL=4
FLOW_STEP=3
VERBOSE=1
LOG_PATH="/tmp/snd_catcher_log"
REC_PATH="/tmp/snd_catcher_recs"

# {{{ ARGUMENTS
help() {
	cat <<EOH
Usage: $SCRIPTNAME [options]
	-h, --help 					get this small help
	-v, --verbose <int>			set verbose level
								0 - be quite;
								1 - write to <--log-path>;
								2 - write to <--log-path> and to stdout;
								3 - write to pipe and stop script if not listen;
								4-6 - same, but with current noise level.
	-w, --wait-time <int>		time in seconds before set normal volume
	-s, --set-volume <int>		set volume in percent when catched noise
	-m, --max-level <int>		sensitivity in percent
	-f, --flow-step <int>		speed of smooth changing volume (1 - slowest)
	-l, --log-path <filepath>	path to logfile
	-r, --rec-path <filepath>	path to recorded noise
	--							end of arguments (needed)

Catch sound level from alsa input device and stop or set low volume
TODO: autoplay last recorded noise
EOH
	exit
}

while true; do
	case "$1" in
		-v|--verbose)		VERBOSE="$2";		shift 2 ;;
		-w|--wait-time)		WAIT_TIME="$2";		shift 2 ;;
		-s|--set-volume)	SET_SND="$2";		shift 2 ;;
		-m|--max-level)		MAX_LVL="$2";		shift 2 ;;
		-f|--flow-step)		FLOW_STEP="$2";		shift 2 ;;
		-l|--log-path)		LOG_PATH="$2";	    shift 2 ;;
		-r|--rec-path)		REC_PATH="$2";	    shift 2 ;;
#		-v|--verbose)		CHANGE_PROFILE=1;	shift ;;
		-h|--help)			help ;;
		--)					shift; break ;;
		*)					echo "Error: $1"; exit 1;;
	esac
done

GET_SND() {
#	echo "$(amixer get Master | grep -o "[0-9]\{1,3\}%" | tr -d %)"
	echo "$(mpc volume | grep -o "[0-9]\{1,3\}" | tr -d %)"
}
SET_SND() {
#	amixer -q set Master ${1}%
	mpc volume ${1} > /dev/null
}

if [ $VERBOSE -eq 0 ]
then
	LOG_PATH="/dev/null"
	MAX_LOG_PATH="/dev/null"
elif [ $VERBOSE -eq 1 ]
then
	echo "Started at $(date)" >> $LOG_PATH
	MAX_LOG_PATH="/dev/null"
elif [ $VERBOSE -eq 2 ]
then
	tail -F $LOG_PATH --pid=$$ &
	echo "Started at $(date)" >> $LOG_PATH
	MAX_LOG_PATH="/dev/null"
elif [ $VERBOSE -eq 3 ]
then
	[ -p "${LOG_PATH}" ] || (rm -rf $LOG_PATH && mkfifo "$LOG_PATH")
	tail -F $LOG_PATH --pid=$$ &
	MAX_LOG_PATH="/dev/null"
elif [ $VERBOSE -eq 4 ]
then
	echo "Started at $(date)" >> $LOG_PATH
	MAX_LOG_PATH="$LOG_PATH"
elif [ $VERBOSE -eq 5 ]
then
	tail -F $LOG_PATH --pid=$$ &
	echo "Started at $(date)" >> $LOG_PATH
	MAX_LOG_PATH="$LOG_PATH"
elif [ $VERBOSE -eq 6 ]
then
	[ -p "${LOG_PATH}" ] || (rm -rf $LOG_PATH && mkfifo "$LOG_PATH")
	tail -F $LOG_PATH --pid=$$ &
	MAX_LOG_PATH="$LOG_PATH"
fi

[ -d "$REC_PATH" ] || mkdir "${REC_PATH}"

# }}} ARGS

EXIT() {
	case $1 in
		1)	echo "ERROR UNKNOWN" >&2 ; exit 1;;
		2)	echo "arecord: device not found" >&2 ; exit 2;;
		3)	echo "WARNING: FLOW_STEP too small" >&2 ; exit 3;;
		*)	echo "EXIT() broken" >&2 ; exit 1;;
	esac
}

CUR_SND="$(GET_SND)"
WT_TIME=0
[ $FLOW_STEP -lt 1 ] && EXIT 3

#(
#	while sleep $WAIT_TIME
#	do
#		cat "${REC_PATH}/cur_rec" > "${REC_PATH}/prev_rec"
#		echo "" > "${REC_PATH}/cur_rec"
#		echo "cutted" >> $LOG_PATH
#	done
#) & PID_REC_CUT=$!
#trap "kill -s KILL $PID_REC_CUT ; exit 0" INT

while true
	do
		WT_TIME=$WAIT_TIME

		(
			sleep $WT_TIME
			FLOW_SND="$(GET_SND)"
			while [ $FLOW_SND -le $CUR_SND ]
			do
				SET_SND ${FLOW_SND}
				FLOW_SND=$((FLOW_SND+FLOW_STEP))
			done
			SET_SND ${CUR_SND}
		) & PID_VOL_UP=$!
	
		arecord -D hw:1,0 -f dat -c 1 -vvv "${REC_PATH}/cur_rec" 2>&1 | \
			tee $MAX_LOG_PATH | \
			grep -o -m 1 "[${MAX_LVL}-9][0-9]%" >> $LOG_PATH \
			|| EXIT 2
		echo "Something catched at $(date). Listening..." >> $LOG_PATH

#		arecord -D hw:1,0 -f dat -c 1 "${REC_PATH}/post_rec"  & PID_REC=$!
	
		tail -c 200k "${REC_PATH}/cur_rec" | aplay -f dat -c 1 &
#		head -c 100k "${REC_PATH}/post_rec" | aplay -f dat -c 1
	
		TMP_SND="$(GET_SND)"
		kill $PID_VOL_UP 2>/dev/null || CUR_SND=$TMP_SND
	
		FLOW_SND=${TMP_SND}
		while [ $FLOW_SND -ge $SET_SND ]
		do
			FLOW_SND=$((FLOW_SND-FLOW_STEP))
			SET_SND ${FLOW_SND}
		done
		SET_SND ${SET_SND}
done

