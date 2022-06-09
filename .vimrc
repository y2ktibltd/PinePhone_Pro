syntax on

set encoding=utf-8
set nu
set showmatch
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set noerrorbells visualbell t_vb=
set nowrap
set smartcase
set noswapfile
set incsearch
set pastetoggle=<F2>

map <F8> :call RunCode()<CR>

call plug#begin()
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'preservim/nerdtree'
    Plug 'wfxr/minimap.vim'
call plug#end()

let g:NERDTreeWinSize=15

let g:minimap_width=15
let g:minimap_auto_start=1
let g:minimap_highlight_range=1
let g:minimap_highlight_search=1

let g:minimap_close_filetypes=['startify', 'netrw', 'vim-plug']
let g:minimap_block_buftypes=['nofile', 'nowrite', 'quickfix', 'terminal', 'prompt']
let g:minimap_block_filetypes=['fugitive', 'nerdtree', 'tagbar']

function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \ bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__' ||
          \ bufname(winbufnr(i)) == '-MINIMAP-'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

autocmd vimenter * NERDTree | wincmd p
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

colorscheme dracula 

" Statusline (requires Powerline font)
set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
set statusline+=%< " Truncate line here
set statusline+=%f\  " File path, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ 
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|
" ------------------------ 8< ------------------------
" Statusline with highlight groups (requires Powerline font, using Solarized theme)
set statusline=
set statusline+=%(%{&buflisted?bufnr('%'):''}\ \ %)
set statusline+=%< " Truncate line here
set statusline+=%f\  " File path, as typed or relative to current directory
set statusline+=%{&modified?'+\ ':''}
set statusline+=%{&readonly?'\ ':''}
set statusline+=%1*\  " Set highlight group to User1
set statusline+=%= " Separation point between left and right aligned items
set statusline+=\ %{&filetype!=#''?&filetype:'none'}
set statusline+=%(\ %{(&bomb\|\|&fileencoding!~#'^$\\\|utf-8'?'\ '.&fileencoding.(&bomb?'-bom':''):'')
  \.(&fileformat!=#(has('win32')?'dos':'unix')?'\ '.&fileformat:'')}%)
set statusline+=%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)
set statusline+=\ %* " Restore normal highlight
set statusline+=\ %{&number?'':printf('%2d,',line('.'))} " Line number
set statusline+=%-2v " Virtual column number
set statusline+=\ %2p%% " Percentage through file in lines as in |CTRL-G|
" Logic for customizing the User1 highlight group is the following
" - if StatusLine colors are reverse, then User1 is not reverse and User1 fg = StatusLine fg
hi StatusLine cterm=reverse gui=reverse ctermfg=14 ctermbg=8 guifg=#93a1a1 guibg=#002732
hi StatusLineNC cterm=reverse gui=reverse ctermfg=11 ctermbg=0 guifg=#657b83 guibg=#073642
hi User1 ctermfg=14 ctermbg=0 guifg=#93a1a1 guibg=#073642

function RunCode()
    let file_ext=expand('%:e')
    if file_ext=='py'
        :w!
        :term ./%
    elseif file_ext=='c'
	if match(readfile(expand("%:p")),"include <math.h>")!=-1
	        :w!
	        :!gcc -Wall % -o %<.out -lm
	        :term ./%<.out
	elseif match(readfile(expand("%:p")),"include <gtk/gtk.h>")!=-1
	        :w!
	        :!gcc -Wall % -o %<.out $(pkg-config --cflags --libs gtk+-3.0)
	        :term ./%<.out
	else
	        :w!
	        :!gcc -Wall % -o %<.out
	        :term ./%<.out
	endif
    elseif file_ext=='sh'
	:w!
	:term sh ./%
    endif
endfunction
