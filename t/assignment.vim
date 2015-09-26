filetype plugin on
runtime! plugin/textobj/assignment.vim


describe 'ir'
    after
        bwipeout!
    end

    it 'selects right hand sides'
        put! = 'foo = bar + baz'
        normal! 2|
        normal dir
        Expect getline(1) == 'foo = '
    end

    it 'selects RHS at the ='
        put! = 'spam = eggs'
        normal! f=
        normal dir
        Expect getline(1) == 'spam = '
    end
end


describe 'ar'
    after
        bwipeout!
    end

    it 'selects right hand sides'
        put! = 'foo = bar'
        normal! 2|
        normal dar
        Expect getline(1) == 'foo'
    end

    it 'selects RHS at the ='
        put! = 'spam = eggs'
        normal! f=
        normal dar
        Expect getline(1) == 'spam'
    end
end
