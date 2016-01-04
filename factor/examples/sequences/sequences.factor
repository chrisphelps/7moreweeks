USING: kernel sequences ;
IN: examples.sequences

! easy way - use the existing find - returns 2 stack elements so nip one
! this had to use the "inline word" but I don't know what this means
: find-first ( seq pred: ( x -- ? ) -- y ) 
    find nip ; inline
