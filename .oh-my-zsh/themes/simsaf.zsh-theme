# Prompt
setopt extended_glob
	print -Pn "\e]0;$1\a"

setprompt () {
	# Need this so the prompt will work.
	setopt prompt_subst
	autoload zsh/terminfo
	for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
		eval PR_$color='%{$terminfo[normal]$fg[${(L)color}]%}'
		eval PR_BOLD_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	done
	PR_NO_COLOUR="%{$terminfo[sgr0]%}"
#	PR_RED=$(       printf "\033[31m")
#	PR_YELLOW=$(    printf "\033[33m")
#	PR_GREEN=$(     printf "\033[32m")
#	PR_MAGENTA=$(   printf "\033[35m")
#	PR_WHITE=$(     printf "\033[37m")
#	PR_BOLD_BLUE=$( printf "\033[1;34m")
#	PR_NO_COLOUR=$( printf "\033[0m")

#	LINE_CONS="simsaf"
#	LINE=`print "$fg[blue]${(l.((${COLUMNS}-${#LINE_CONS}-5))..─.)}$reset_color $LINE_CONS $fg[blue]───$reset_color"`
#	PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .) %n@%M:(%~) $(git_prompt_info) $(rvm_prompt_info) | ${COLUMNS}x${LINES} | %y\a%}'
case "$TERM" in
	st*)			PR_TERM='(S)';;
	linux*)			PR_TERM='(L)';;
	xterm*|uxterm*)	PR_TERM='(X)';;
	rxvt*|urxvt*)	PR_TERM='(R)';;
	mlterm*)		PR_TERM='(M)';;
	tmux*)			PR_TERM='(T)';;
	*)				PR_TERM='(?)';;
esac

	PR_SHELL="[zsh"
#	[ -n "$TMUX" ] && PR_SHELL="$(tmux display-message -p | grep -o "\[.*\]")%${TMUX_PANE}"
	[ -n "$TMUX" ] && PR_SHELL="${PR_SHELL}:tmux"
	[ -n "$TMUXIN" ] && PR_SHELL="${PR_SHELL}in"
	PR_SHELL="${PR_SHELL}]"

#PROMPT='${(e)PR_TITLEBAR}\
PROMPT='\
$PR_RED%(?,$PR_GREEN,%?) \
$PR_YELLOW%(1j.(%j).$PR_GREEN(0%))\
$PR_GREEN%(!.$PR_RED%SROOT%s.%n)\
$PR_RED$PR_TERM$PR_GREEN%M\
$PR_MAGENTA$PR_SHELL$PR_WHITE\
$PR_BOLD_BLUE:%~\
$PR_NO_COLOUR%(#,#,$)\
$PR_NO_COLOUR '
}
setprompt
