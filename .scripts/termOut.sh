#!/bin/bash
# FIND="Core 1: "
# RESULT=$(sensors 
# 	| sed -n "/$FIND/p" 
# 	| sed "s/$FIND//g" 
# 	| sed 's/ (.*)//g' 
# 	| sed 's/+//g'
# 	| sed 's/
# 	//g')
# echo $RESULT
FIND="temp1: "
RESULT=$(sensors | sed -n "/$FIND/p"	| sed "s/$FIND//g" 	| sed 's/ (.*)//g' | sed 's/+//g')
echo $RESULT

exit

