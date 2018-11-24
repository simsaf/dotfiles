#!/bin/bash
#curl -s $1 
VID=$(curl -s $1 | sed -n '/og:video"/p' | sed 's/^.*http/http/' | sed 's/mp4.*$/mp4/')   
wget $VID -O instavid.mp4
mplayer -fs instavid.mp4
