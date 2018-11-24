au! BufRead,BufNewFile * if getline(1) =~ '^#!.*dash' | setfiletype sh | endif
