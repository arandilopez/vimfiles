" Project search
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --vimgrep\ -i
  command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap <Leader>sp :Ag<SPACE>

elseif executable('rg')
  " Or use ripgrep
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  command -nargs=+ -complete=file -bar Rg silent! grep! <args>|cwindow|redraw!
  nnoremap <Leader>sp :Rg<SPACE>
endif
