#!/bin/zsh

#default {{{
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simsaf"
# .oh-my-zsh/themes/simsaf.zsh-theme
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# }}}

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases
#source $ZDOTDIR/.script/color.sh

# User configuration {{{

export EDITOR=vim
export MAIL=~/mail
export MAILPATH=~/mail

# added by Anaconda3 4.4.0 installer
# export PATH="/home/simsaf/anaconda3/bin:$PATH"
#
[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(in ranger) '
#
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_MESSAGES=C

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias x='startx'
bindkey \^U backward-kill-line

#export LS_COLORS={{{
export LS_COLORS='rs=0:'\
'di=01;34:'\
'ln=01;36:'\
'mh=00:'\
'pi=01;33:'\
'so=01;35:'\
'do=01;35:'\
'bd=40;33;01:'\
'cd=40;33;01:'\
'or=40;31;01:'\
'mi=00:'\
'su=37;41:'\
'sg=30;43:'\
'ca=30;41:'\
'tw=30;42:'\
'ow=34;42:'\
'st=37;44:'\
'ex=01;32:'\
'*.tar=01;31:'\
'*.tgz=01;31:'\
'*.arc=01;31:'\
'*.arj=01;31:'\
'*.taz=01;31:'\
'*.lha=01;31:'\
'*.lz4=01;31:'\
'*.lzh=01;31:'\
'*.lzma=01;31:'\
'*.tlz=01;31:'\
'*.txz=01;31:'\
'*.tzo=01;31:'\
'*.t7z=01;31:'\
'*.zip=01;31:'\
'*.z=01;31:'\
'*.Z=01;31:'\
'*.dz=01;31:'\
'*.gz=01;31:'\
'*.lrz=01;31:'\
'*.lz=01;31:'\
'*.lzo=01;31:'\
'*.xz=01;31:'\
'*.zst=01;31:'\
'*.tzst=01;31:'\
'*.bz2=01;31:'\
'*.bz=01;31:'\
'*.tbz=01;31:'\
'*.tbz2=01;31:'\
'*.tz=01;31:'\
'*.deb=01;31:'\
'*.rpm=01;31:'\
'*.jar=01;31:'\
'*.war=01;31:'\
'*.ear=01;31:'\
'*.sar=01;31:'\
'*.rar=01;31:'\
'*.alz=01;31:'\
'*.ace=01;31:'\
'*.zoo=01;31:'\
'*.cpio=01;31:'\
'*.7z=01;31:'\
'*.rz=01;31:'\
'*.cab=01;31:'\
'*.wim=01;31:'\
'*.swm=01;31:'\
'*.dwm=01;31:'\
'*.esd=01;31:'\
'*.jpg=33:'\
'*.jpeg=33:'\
'*.mjpg=33:'\
'*.mjpeg=33:'\
'*.gif=33:'\
'*.bmp=33:'\
'*.pbm=33:'\
'*.pgm=33:'\
'*.ppm=33:'\
'*.tga=33:'\
'*.xbm=33:'\
'*.xpm=33:'\
'*.tif=33:'\
'*.tiff=33:'\
'*.png=33:'\
'*.svg=33:'\
'*.svgz=33:'\
'*.mng=33:'\
'*.pcx=33:'\
'*.mov=01;35:'\
'*.mpg=01;35:'\
'*.mpeg=01;35:'\
'*.m2v=01;35:'\
'*.mkv=01;35:'\
'*.webm=01;35:'\
'*.ogm=01;35:'\
'*.mp4=01;35:'\
'*.m4v=01;35:'\
'*.mp4v=01;35:'\
'*.vob=01;35:'\
'*.qt=01;35:'\
'*.nuv=01;35:'\
'*.wmv=01;35:'\
'*.asf=01;35:'\
'*.rm=01;35:'\
'*.rmvb=01;35:'\
'*.flc=01;35:'\
'*.avi=01;35:'\
'*.fli=01;35:'\
'*.flv=01;35:'\
'*.gl=01;35:'\
'*.dl=01;35:'\
'*.xcf=01;35:'\
'*.xwd=01;35:'\
'*.yuv=01;35:'\
'*.cgm=01;35:'\
'*.emf=01;35:'\
'*.ogv=01;35:'\
'*.ogx=01;35:'\
'*.aac=00;36:'\
'*.au=00;36:'\
'*.flac=00;36:'\
'*.m4a=00;36:'\
'*.mid=00;36:'\
'*.midi=00;36:'\
'*.mka=00;36:'\
'*.mp3=00;36:'\
'*.mpc=00;36:'\
'*.ogg=00;36:'\
'*.ra=00;36:'\
'*.wav=00;36:'\
'*.oga=01;36:'\
'*.opus=00;36:'\
'*.spx=00;36:'\
'*.xspf=00;36:'\
'*.pdf=00;31:'\
'*.djvu=00;31:'\
''
#}}}
#
# if [ "$TERM" == "linux" ] {{{
if [ "$TERM" = "linux" ]
then
	TERM_FONT() {
		setfont dina
		WATCH="${HOME}/.fonts/${TTY#/dev/}"
		case "$1" in
			start*)	(
					tail -F $WATCH | while read font
						do
							case "$font" in
								0*)	exit;;
								1*)	font="dina";;
								2*)	font="knxt-new";;
								*)	font="dina";;
							esac
							setfont $font
						done
					) & ;;
			stop*) echo 0 > $WATCH ;;
		esac
	}

	#setting console colors
	echo -en "\e]P0000000"    #  "#000000"
	echo -en "\e]P1cc0000"    #  "#cc0000"
	echo -en "\e]P24e9a06"    #  "#4e9a06"
	echo -en "\e]P3c4a000"    #  "#c4a000"
	echo -en "\e]P43465a4"    #  "#3465a4"
	echo -en "\e]P575507b"    #  "#75507b"
	echo -en "\e]P606989a"    #  "#06989a"
	echo -en "\e]P7d3d3d3"    #  "#d3d3d3"
	echo -en "\e]P8444444"    #  "#444444"
	echo -en "\e]P9ef2929"    #  "#ef2929"
	echo -en "\e]Pa8ae234"    #  "#8ae234"
	echo -en "\e]Pbfce94f"    #  "#fce94f"
	echo -en "\e]Pc729fcf"    #  "#729fcf"
	echo -en "\e]Pdad7fa8"    #  "#ad7fa8"
	echo -en "\e]Pe34e2e2"    #  "#34e2e2"
	echo -en "\e]Pfeeeeec"    #  "#eeeeec"
	
#	TERM_FONT start
#	tmux
#	TERM_FONT stop
#	clear; echo "Logout recived" ; sleep 2
#	exit
fi #}}}

#export PATH="/usr/lib/cw:$PATH"
#export NOCOLOR_PIPE=1
#export CW_SHLVL=4
# }}}
VIS_PATH="${HOME}/.vis"
#BASHISHDIR="/usr/share/bashish"                 ## line added by bashish
#TTY=`tty 2>/dev/null` && if test "x$BASHISHDIR" != x;then       ## line added by bashish
#test "$BASHISH_OLDPATH"||BASHISH_OLDPATH="$PATH"                ## line added by bashish
#PATH="$HOME/.bashish/launcher:$BASHISHDIR/lib:$BASHISH_OLDPATH" ## line added by bashish
#BASHSISH_CP=utf8                                                 ## line added by bashish
#BASHSISH_CP=437                                                 ## line added by bashish
#TEST_TERM="$TERM" _bashish_utfcheck && BASHISH_CP=utf8          ## line added by bashish
#ENV="$HOME/.profile"                                            ## line added by bashish
#export BASHISH_CP BASHISH_OLDPATH TTY ENV                       ## line added by bashish
#. "$BASHISHDIR/main/prompt/sh/init"                             ## line added by bashish
#fi                                                              ## line added by bashish
