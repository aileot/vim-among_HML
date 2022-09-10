" ============================================================================
" File: autoload/among_HML.vim
" Author: aileot
" License: MIT License
" ============================================================================

if v:version < 700 | finish | endif

if exists('g:loaded_among_HML') | finish | endif
let g:loaded_among_HML = 1

" save cpoptions {{{
let s:save_cpo = &cpo
set cpo&vim
"}}}

function! among_HML#jump(ratio)
  let save_so = &scrolloff
  set scrolloff=0
  let ratio = a:ratio
  if a:ratio > 1.0
    " Backward compatibility
    let ratio = a:ratio / 100.0
    echohl ErrorMsg
    echomsg '[among_HML] Percentage is deprecated. Please use a ratio (0.0 ~ 1.0)'
    echohl None
  endif
  normal! L
  let win_bottom = winline()
  " Note: round() is necessary for rational motion in fewer lines.
  let dest = round(win_bottom * ratio)
  let count = float2nr(win_bottom - dest)
  execute 'normal!' count .'gk'
  let &scrolloff = save_so
endfunction

" restore cpoptions {{{1
let &cpo = s:save_cpo
unlet s:save_cpo

" modeline {{{1
" vim: ts=2 sts=2 sw=2 et fdm=marker
