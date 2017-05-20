function! s:select_i()
    python select_assignment_rhs()
endfunction

function! s:select_a()
    python select_assignment()
endfunction

function! textobj#assignment#select_i() abort
    return s:select_i()
endfunction

function! textobj#assignment#select_a() abort
    return s:select_a()
endfunction


python <<endpython
import re

import vim


ASSIGNMENT = re.compile(r"(\s*)=(\s*)")
CURRENT = vim.current


def find_assignment():
    buffer_number, raw_row, raw_column, offset = vim.eval("getpos('.')")
    current_row, current_column = int(raw_row) - 1, int(raw_column) - 1
    match = ASSIGNMENT.search(CURRENT.line)
    return match, dict(
        start_row=current_row,
        end_row=current_row,
        end_column=len(CURRENT.line),
        buffer_number=buffer_number,
        offset=offset,
    )


def select_assignment_rhs():
    match, positions = find_assignment()
    return_(start_column=match.end(), **positions)


def select_assignment():
    match, positions = find_assignment()
    return_(start_column=match.start(), **positions)


def return_(
    buffer_number,
    start_row,
    start_column,
    end_row,
    end_column,
    offset,
):
    vim.command(
        "return ["
            "'v', "
            "[{buffer_number}, {start_row}, {start_column}, {offset}], "
            "[{buffer_number}, {end_row}, {end_column}, {offset}]"
        "]".format(
            buffer_number=buffer_number,
            start_row=start_row + 1,
            start_column=start_column + 1,
            end_row=end_row + 1,
            end_column=end_column + 1,
            offset=offset,
        ),
    )
endpython
