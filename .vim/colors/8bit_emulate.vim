" Vim color file
" Maintainer:	simsaf
" Last Change:	Чт. дек.  7 21:30:46 SAMT 2017

" This is the default color scheme.  It doesn't define the Normal
" highlighting, it uses whatever the colors used to be.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
	 syntax reset
endif
let colors_name = "8bit_emulate"
"hi TEst ctermfg=0     
"hi TEst ctermfg=1        black 0
"hi TEst ctermfg=2        red 1
"hi TEst ctermfg=3        green 2
"hi TEst ctermfg=4        yellow 3
"hi TEst ctermfg=5        blue 4
"hi TEst ctermfg=6        pink 5
"hi TEst ctermfg=7    cyan 6
"hi TEst ctermfg=8   white 7
"hi TEst ctermfg=9
"hi TEst ctermfg=10       lightgreen
"hi TEst ctermfg=11
"hi TEst ctermfg=12
"hi TEst ctermfg=13
"hi TEst ctermfg=14
"hi TEst ctermfg=15
"hi TEst ctermfg=16
" {{{
"hi Normal cleared
"cterm=NONE      ctermfg=7      ctermbg=0
hi LineNr         cterm=NONE             ctermfg=3      ctermbg=0
hi Folded         cterm=NONE             ctermfg=4      ctermbg=0
hi FoldColumn     cterm=NONE             ctermfg=4      ctermbg=0
hi CursorLineNr   cterm=bold             ctermfg=3      ctermbg=8
hi CursorLine     cterm=NONE             ctermfg=NONE   ctermbg=8
hi CursorColumn   cterm=NONE             ctermfg=NONE   ctermbg=8
hi VertSplit      cterm=NONE             ctermfg=8      ctermbg=0
hi SpecialKey     cterm=NONE             ctermfg=8      ctermbg=0
hi Comment        cterm=italic           ctermfg=4      ctermbg=0
hi Directory      cterm=bold             ctermfg=4
hi NonText        cterm=NONE             ctermfg=8
hi ErrorMsg       cterm=bold             ctermfg=7      ctermbg=1
hi IncSearch      cterm=reverse          ctermfg=NONE   ctermbg=NONE
hi Search         cterm=NONE             ctermfg=0      ctermbg=3
hi MoreMsg        cterm=NONE             ctermfg=2
hi ModeMsg        cterm=bold             ctermfg=7      ctermbg=6
hi Question       cterm=NONE             ctermfg=2
hi StatusLine     cterm=NONE             ctermfg=7      ctermbg=8
hi StatusLineNC   cterm=underline,bold        ctermfg=8      ctermbg=0
hi Title          cterm=none             ctermfg=7
hi Visual         cterm=reverse          ctermfg=3
hi VisualNOS      cterm=bold,underline
hi WarningMsg     cterm=NONE             ctermfg=1
hi WildMenu       cterm=NONE             ctermfg=0      ctermbg=3
hi DiffAdd        ctermbg=4
hi DiffChange     ctermbg=5
hi DiffDelete     cterm=bold             ctermfg=4      ctermbg=6
hi DiffText       cterm=bold             ctermbg=1
hi SignColumn     ctermfg=4              ctermbg=0
hi Conceal        ctermfg=7              ctermbg=0
hi SpellBad       ctermbg=1
hi SpellCap       ctermbg=4
hi SpellRare      ctermbg=5
hi SpellLocal     ctermbg=6
hi Pmenu          ctermfg=0              ctermbg=5
hi PmenuSel       ctermfg=0              ctermbg=7
hi PmenuSbar      ctermbg=7
hi PmenuThumb     ctermbg=0
hi TabLine        cterm=none             ctermfg=7      ctermbg=8
hi TabLineSel     cterm=bold             ctermfg=7      ctermbg=0
hi TabLineFill    cterm=NONE             ctermfg=7      ctermbg=8
hi MatchParen     ctermbg=6
hi ColorColumn    ctermbg=8
hi Constant       ctermfg=1
hi Special        ctermfg=5
hi Identifier     ctermfg=6
hi Statement      ctermfg=3
hi PreProc                               ctermfg=5
hi Type                                  ctermfg=2
hi Underlined      cterm=underline       ctermfg=5
hi Ignore          cterm=bold            ctermfg=7
hi Error           cterm=bold            ctermfg=7   ctermbg=1
hi Todo                                  ctermfg=0   ctermbg=3


" }}}}}}
