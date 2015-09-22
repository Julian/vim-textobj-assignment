# vim-textobj-assignment

A vim plugin providing a single text object (on `ir` and `ar`) for
the *r*ight hand side of variable assignments.

E.g.:

    f|oo = bar    -> cirbaz -> foo = baz
    spam|=quux  -> cireggs -> spam=eggs

Requires [vim-textobj-user](https://github.com/kana/vim-textobj-user).
