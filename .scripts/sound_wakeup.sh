#!/bin/dash

while sleep 3
do
	arecord -D hw:0,0 -f dat -vvv /dev/null 2>&1 | \
		grep -B 1 -m 1 "[1-9]%" \
		|| exit 1
	iocane -c 0
done
