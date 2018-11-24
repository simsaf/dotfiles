" Language   : File System Syntax
" Maintainer : simsaf
" Last change: 01.01.2018
" Version    : 0.1	NOT RELEASED
" ---------------------------------------------------------------------
syn match  fsftDir	#.*/#
syn match  fsftPDF	#.*\.pdf#
" extensions {{{
syn match fsfttar    #.*\.tar#
syn match fsfttgz    #.*\.tgz#
syn match fsftarc    #.*\.arc#
syn match fsftarj    #.*\.arj#
syn match fsfttaz    #.*\.taz#
syn match fsftlha    #.*\.lha#
syn match fsftlz4    #.*\.lz4#
syn match fsftlzh    #.*\.lzh#
syn match fsftlzma   #.*\.lzma#
syn match fsfttlz    #.*\.tlz#
syn match fsfttxz    #.*\.txz#
syn match fsfttzo    #.*\.tzo#
syn match fsftt7z    #.*\.t7z#
syn match fsftzip    #.*\.zip#
syn match fsftz      #.*\.z#
syn match fsftZ      #.*\.Z#
syn match fsftdz     #.*\.dz#
syn match fsftgz     #.*\.gz#
syn match fsftlrz    #.*\.lrz#
syn match fsftlz     #.*\.lz#
syn match fsftlzo    #.*\.lzo#
syn match fsftxz     #.*\.xz#
syn match fsftzst    #.*\.zst#
syn match fsfttzst   #.*\.tzst#
syn match fsftbz2    #.*\.bz2#
syn match fsftbz     #.*\.bz#
syn match fsfttbz    #.*\.tbz#
syn match fsfttbz2   #.*\.tbz2#
syn match fsfttz     #.*\.tz#
syn match fsftdeb    #.*\.deb#
syn match fsftrpm    #.*\.rpm#
syn match fsftjar    #.*\.jar#
syn match fsftwar    #.*\.war#
syn match fsftear    #.*\.ear#
syn match fsftsar    #.*\.sar#
syn match fsftrar    #.*\.rar#
syn match fsftalz    #.*\.alz#
syn match fsftace    #.*\.ace#
syn match fsftzoo    #.*\.zoo#
syn match fsftcpio   #.*\.cpio#
syn match fsft7z     #.*\.7z#
syn match fsftrz     #.*\.rz#
syn match fsftcab    #.*\.cab#
syn match fsftwim    #.*\.wim#
syn match fsftswm    #.*\.swm#
syn match fsftdwm    #.*\.dwm#
syn match fsftesd    #.*\.esd#
syn match fsftjpg    #.*\.jpg#
syn match fsftjpeg   #.*\.jpeg#
syn match fsftmjpg   #.*\.mjpg#
syn match fsftmjpeg  #.*\.mjpeg#
syn match fsftgif    #.*\.gif#
syn match fsftbmp    #.*\.bmp#
syn match fsftpbm    #.*\.pbm#
syn match fsftpgm    #.*\.pgm#
syn match fsftppm    #.*\.ppm#
syn match fsfttga    #.*\.tga#
syn match fsftxbm    #.*\.xbm#
syn match fsftxpm    #.*\.xpm#
syn match fsfttif    #.*\.tif#
syn match fsfttiff   #.*\.tiff#
syn match fsftpng    #.*\.png#
syn match fsftsvg    #.*\.svg#
syn match fsftsvgz   #.*\.svgz#
syn match fsftmng    #.*\.mng#
syn match fsftpcx    #.*\.pcx#
syn match fsftmov    #.*\.mov#
syn match fsftmpg    #.*\.mpg#
syn match fsftmpeg   #.*\.mpeg#
syn match fsftm2v    #.*\.m2v#
syn match fsftmkv    #.*\.mkv#
syn match fsftwebm   #.*\.webm#
syn match fsftogm    #.*\.ogm#
syn match fsftmp4    #.*\.mp4#
syn match fsftm4v    #.*\.m4v#
syn match fsftmp4v   #.*\.mp4v#
syn match fsftvob    #.*\.vob#
syn match fsftqt     #.*\.qt#
syn match fsftnuv    #.*\.nuv#
syn match fsftwmv    #.*\.wmv#
syn match fsftasf    #.*\.asf#
syn match fsftrm     #.*\.rm#
syn match fsftrmvb   #.*\.rmvb#
syn match fsftflc    #.*\.flc#
syn match fsftavi    #.*\.avi#
syn match fsftfli    #.*\.fli#
syn match fsftflv    #.*\.flv#
syn match fsftgl     #.*\.gl#
syn match fsftdl     #.*\.dl#
syn match fsftxcf    #.*\.xcf#
syn match fsftxwd    #.*\.xwd#
syn match fsftyuv    #.*\.yuv#
syn match fsftcgm    #.*\.cgm#
syn match fsftemf    #.*\.emf#
syn match fsftogv    #.*\.ogv#
syn match fsftogx    #.*\.ogx#
syn match fsftaac    #.*\.aac#
syn match fsftau     #.*\.au#
syn match fsftflac   #.*\.flac#
syn match fsftm4a    #.*\.m4a#
syn match fsftmid    #.*\.mid#
syn match fsftmidi   #.*\.midi#
syn match fsftmka    #.*\.mka#
syn match fsftmp3    #.*\.mp3#
syn match fsftmpc    #.*\.mpc#
syn match fsftogg    #.*\.ogg#
syn match fsftra     #.*\.ra#
syn match fsftwav    #.*\.wav#
syn match fsftoga    #.*\.oga#
syn match fsftopus   #.*\.opus#
syn match fsftspx    #.*\.spx#
syn match fsftxspf   #.*\.xspf#
" }}}
hi FSFT_picture cterm=none ctermfg=3


hi default link fsftDir Directory
hi default link fsftPDF Number


hi fsfttar   ctermfg=9  " *.tgz=01;31   ctermfg=9
hi fsfttgz   ctermfg=9  " *.tgz=01;31   ctermfg=9
hi fsftarc   ctermfg=9  " *.arc=01;31   ctermfg=9
hi fsftarj   ctermfg=9  " *.arj=01;31   ctermfg=9
hi fsfttaz   ctermfg=9  " *.taz=01;31   ctermfg=9
hi fsftlha   ctermfg=9  " *.lha=01;31   ctermfg=9
hi fsftlz4   ctermfg=9  " *.lz4=01;31   ctermfg=9
hi fsftlzh   ctermfg=9  " *.lzh=01;31   ctermfg=9
hi fsftlzma  ctermfg=9  " *.lzma=01;31  ctermfg=9
hi fsfttlz   ctermfg=9  " *.tlz=01;31   ctermfg=9
hi fsfttxz   ctermfg=9  " *.txz=01;31   ctermfg=9
hi fsfttzo   ctermfg=9  " *.tzo=01;31   ctermfg=9
hi fsftt7z   ctermfg=9  " *.t7z=01;31   ctermfg=9
hi fsftzip   ctermfg=9  " *.zip=01;31   ctermfg=9
hi fsftz     ctermfg=9  " *.z=01;31     ctermfg=9
hi fsftZ     ctermfg=9  " *.Z=01;31     ctermfg=9
hi fsftdz    ctermfg=9  " *.dz=01;31    ctermfg=9
hi fsftgz    ctermfg=9  " *.gz=01;31    ctermfg=9
hi fsftlrz   ctermfg=9  " *.lrz=01;31   ctermfg=9
hi fsftlz    ctermfg=9  " *.lz=01;31    ctermfg=9
hi fsftlzo   ctermfg=9  " *.lzo=01;31   ctermfg=9
hi fsftxz    ctermfg=9  " *.xz=01;31    ctermfg=9
hi fsftzst   ctermfg=9  " *.zst=01;31   ctermfg=9
hi fsfttzst  ctermfg=9  " *.tzst=01;31  ctermfg=9
hi fsftbz2   ctermfg=9  " *.bz2=01;31   ctermfg=9
hi fsftbz    ctermfg=9  " *.bz=01;31    ctermfg=9
hi fsfttbz   ctermfg=9  " *.tbz=01;31   ctermfg=9
hi fsfttbz2  ctermfg=9  " *.tbz2=01;31  ctermfg=9
hi fsfttz    ctermfg=9  " *.tz=01;31    ctermfg=9
hi fsftdeb   ctermfg=9  " *.deb=01;31   ctermfg=9
hi fsftrpm   ctermfg=9  " *.rpm=01;31   ctermfg=9
hi fsftjar   ctermfg=9  " *.jar=01;31   ctermfg=9
hi fsftwar   ctermfg=9  " *.war=01;31   ctermfg=9
hi fsftear   ctermfg=9  " *.ear=01;31   ctermfg=9
hi fsftsar   ctermfg=9  " *.sar=01;31   ctermfg=9
hi fsftrar   ctermfg=9  " *.rar=01;31   ctermfg=9
hi fsftalz   ctermfg=9  " *.alz=01;31   ctermfg=9
hi fsftace   ctermfg=9  " *.ace=01;31   ctermfg=9
hi fsftzoo   ctermfg=9  " *.zoo=01;31   ctermfg=9
hi fsftcpio  ctermfg=9  " *.cpio=01;31  ctermfg=9
hi fsft7z    ctermfg=9  " *.7z=01;31    ctermfg=9
hi fsftrz    ctermfg=9  " *.rz=01;31    ctermfg=9
hi fsftcab   ctermfg=9  " *.cab=01;31   ctermfg=9
hi fsftwim   ctermfg=9  " *.wim=01;31   ctermfg=9
hi fsftswm   ctermfg=9  " *.swm=01;31   ctermfg=9
hi fsftdwm   ctermfg=9  " *.dwm=01;31   ctermfg=9
hi fsftesd   ctermfg=9  " *.esd=01;31   ctermfg=9
hi default link  fsftjpg   FSFT_picture
hi default link  fsftjpeg  FSFT_picture " *.jpeg=01;35  ctermfg=13
hi default link  fsftmjpg  FSFT_picture " *.mjpg=01;35  ctermfg=13
hi default link  fsftmjpeg FSFT_picture " *.mjpeg=01;35 ctermfg=13
hi default link  fsftgif   FSFT_picture " *.gif=01;35   ctermfg=13
hi default link  fsftbmp   FSFT_picture " *.bmp=01;35   ctermfg=13
hi default link  fsftpbm   FSFT_picture " *.pbm=01;35   ctermfg=13
hi default link  fsftpgm   FSFT_picture " *.pgm=01;35   ctermfg=13
hi default link  fsftppm   FSFT_picture " *.ppm=01;35   ctermfg=13
hi default link  fsfttga   FSFT_picture " *.tga=01;35   ctermfg=13
hi default link  fsftxbm   FSFT_picture " *.xbm=01;35   ctermfg=13
hi default link  fsftxpm   FSFT_picture " *.xpm=01;35   ctermfg=13
hi default link  fsfttif   FSFT_picture " *.tif=01;35   ctermfg=13
hi default link  fsfttiff  FSFT_picture " *.tiff=01;35  ctermfg=13
hi default link  fsftpng   FSFT_picture " *.png=01;35   ctermfg=13
hi fsftsvg   ctermfg=13 " *.svg=01;35   ctermfg=13
hi fsftsvgz  ctermfg=13 " *.svgz=01;35  ctermfg=13
hi fsftmng   ctermfg=13 " *.mng=01;35   ctermfg=13
hi fsftpcx   ctermfg=13 " *.pcx=01;35   ctermfg=13
hi fsftmov   ctermfg=13 " *.mov=01;35   ctermfg=13
hi fsftmpg   ctermfg=13 " *.mpg=01;35   ctermfg=13
hi fsftmpeg  ctermfg=13 " *.mpeg=01;35  ctermfg=13
hi fsftm2v   ctermfg=13 " *.m2v=01;35   ctermfg=13
hi fsftmkv   ctermfg=13 " *.mkv=01;35   ctermfg=13
hi fsftwebm  ctermfg=13 " *.webm=01;35  ctermfg=13
hi fsftogm   ctermfg=13 " *.ogm=01;35   ctermfg=13
hi fsftmp4   ctermfg=13 " *.mp4=01;35   ctermfg=13
hi fsftm4v   ctermfg=13 " *.m4v=01;35   ctermfg=13
hi fsftmp4v  ctermfg=13 " *.mp4v=01;35  ctermfg=13
hi fsftvob   ctermfg=13 " *.vob=01;35   ctermfg=13
hi fsftqt    ctermfg=13 " *.qt=01;35    ctermfg=13
hi fsftnuv   ctermfg=13 " *.nuv=01;35   ctermfg=13
hi fsftwmv   ctermfg=13 " *.wmv=01;35   ctermfg=13
hi fsftasf   ctermfg=13 " *.asf=01;35   ctermfg=13
hi fsftrm    ctermfg=13 " *.rm=01;35    ctermfg=13
hi fsftrmvb  ctermfg=13 " *.rmvb=01;35  ctermfg=13
hi fsftflc   ctermfg=13 " *.flc=01;35   ctermfg=13
hi fsftavi   ctermfg=13 " *.avi=01;35   ctermfg=13
hi fsftfli   ctermfg=13 " *.fli=01;35   ctermfg=13
hi fsftflv   ctermfg=13 " *.flv=01;35   ctermfg=13
hi fsftgl    ctermfg=13 " *.gl=01;35    ctermfg=13
hi fsftdl    ctermfg=13 " *.dl=01;35    ctermfg=13
hi fsftxcf   ctermfg=13 " *.xcf=01;35   ctermfg=13
hi fsftxwd   ctermfg=13 " *.xwd=01;35   ctermfg=13
hi fsftyuv   ctermfg=13 " *.yuv=01;35   ctermfg=13
hi fsftcgm   ctermfg=13 " *.cgm=01;35   ctermfg=13
hi fsftemf   ctermfg=13 " *.emf=01;35   ctermfg=13
hi fsftogv   ctermfg=13 " *.ogv=01;35   ctermfg=13
hi fsftogx   ctermfg=13 " *.ogx=01;35   ctermfg=13
hi fsftaac   ctermfg=6  " *.aac=00;36   ctermfg=6
hi fsftau    ctermfg=6  " *.au=00;36    ctermfg=6
hi fsftflac  ctermfg=6  " *.flac=00;36  ctermfg=6
hi fsftm4a   ctermfg=6  " *.m4a=00;36   ctermfg=6
hi fsftmid   ctermfg=6  " *.mid=00;36   ctermfg=6
hi fsftmidi  ctermfg=6  " *.midi=00;36  ctermfg=6
hi fsftmka   ctermfg=6  " *.mka=00;36   ctermfg=6
hi fsftmp3   ctermfg=6  " *.mp3=00;36   ctermfg=6
hi fsftmpc   ctermfg=6  " *.mpc=00;36   ctermfg=6
hi fsftogg   ctermfg=6  " *.ogg=00;36   ctermfg=6
hi fsftra    ctermfg=6  " *.ra=00;36    ctermfg=6
hi fsftwav   ctermfg=6  " *.wav=00;36   ctermfg=6
hi fsftoga   ctermfg=6  " *.oga=00;36   ctermfg=6
hi fsftopus  ctermfg=6  " *.opus=00;36  ctermfg=6
hi fsftspx   ctermfg=6  " *.spx=00;36   ctermfg=6
hi fsftxspf  ctermfg=6  " *.xspf=00;36  ctermfg=6

"
let   b:current_syntax = "fs"
" ---------------------------------------------------------------------
" vim: ts=8 fdm=marker
