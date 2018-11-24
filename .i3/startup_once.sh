#!/bin/dash
pgrep "$1" 1>/dev/null || $1
