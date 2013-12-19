"=============================================================================
" FILE: helloworld.vim
" AUTHOR: haya14busa
" Last Change: 20 Dec 2013.
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================
" Load Once {{{
if exists('g:loaded_helloworld') && g:loaded_helloworld
  finish
endif
let g:loaded_helloworld = 1
" }}}

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" Reference: :h use-cpo-save
" }}}

" Define a user command {{{
command! -nargs=0 HelloWorld call helloworld#sayHello()
" Reference: :h command
"            :h command-nargs
"}}}

" Prepare <Plug> mapping {{{
noremap <silent><expr><Plug>(helloworld-sayHello) helloworld#sayHello()
" Document {{{
" Sample   : <Plug>(scriptname-mapname)
" Reference: :h <Plug>
"            :h using-<Plug>
"            :h map-<expr>
"            :h map-<silent>
" }}}
"}}}

" Map to <Plug> {{{
if ! exists('g:hello_world_not_overwrites_standard_mappings')
    map <unique> <Leader><Leader>h <Plug>(helloworld-sayHello)
    " Document {{{
    " Reference: :h :map-<unique>
    "   the command will fail if the mapping or abbreviation already exists.
    " Error Message Sample:
    "   Error detected while processing /{Path to plugin}/vim-helloworld/plugin/helloworld.vim:
    "   line   {line-num}:
    "   E227: mapping already exists for \\h
    " }}}
endif
"}}}

" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
unlet s:save_cpo
" }}}

" vim: foldmethod=marker
