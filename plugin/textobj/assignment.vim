" textobj-assignmetn: a text object for variable assignments
" Author: Julian Berman
" Version: 0.1.0

if exists('g:loaded_textobj_assignment')
    finish
endif


call textobj#user#plugin('assignment', {
\     '-': {
\         'sfile': expand('<sfile>:p'),
\         'select-a': 'ar', 'select-a-function': 'textobj#assignment#select_a',
\         'select-i': 'ir', 'select-i-function': 'textobj#assignment#select_i',
\       },
\   })

let g:loaded_textobj_assignment = 1
