! Day 2 exercises

USING: random kernel math math.parser io prettyprint ;
IN: examples.numberguess

: compare ( x y -- str )
    - dup 0 < [ drop "You were too low" ]
    [ zero? [ "You got it" ] [ "You were too high" ] if ] if ;

! running this in listener it works fine. running as main, the prompt prints after the input. wat?
: game ( -- )
    "Enter a number" print 
    readln string>number
    10 random 
    dup "I picked " print .    
    compare print ;

MAIN: game
