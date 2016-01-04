! Factor day 2 exercises
! 7 More Languages in 7 Weeks

USING: kernel sequences ;
IN: examples.strings

: palindrome? ( str -- ? ) dup reverse equal? ;