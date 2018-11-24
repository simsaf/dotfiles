#!/bin/bash
LED=$(xset -q | sed -n '/LED/!d;s/.*\([0-9a-f]\{8\}\)$/\1/p')
[ "${LED:4:1}" == "f" ] && LN="ru" || LN="en"
#[ "${LED:4:1}" != "e" ] && LN="ru" || LN="en"
[ "${LED:7:1}" == "d" ] && CL="on" || CL="off"
#[ "${LED:7:1}" != "c" ] && CL="on" || CL="off"
#echo $LN - ${LED:4:1}
#echo $CL - ${LED:7:1}
