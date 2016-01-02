! Factor day one exercises
! 7 More Lanugages in 7 Weeks

! this may not be the right/best way to keep these in a file but I want to keep today's stuff nonetheless

! #1
3 3 * 4 4 * +

! #2
USE: math.functions
3 sq 4 sq + sqrt

! #3
1 2 over swap

! #4
USE: ascii
"Chris" "Hello, " swap append upper

! #5
{ 1 4 17 9 11 } 0 [ + ] reduce

! #6
USE: math.ranges
100 [1,b] 0 [ + ] reduce

! #7
USE: math.ranges
10 [1,b] [ sq ] map

! #8 (first value can be anything, would make a good function)
USE: math.ranges
56 [ 10 /i ] [ 10 mod ] bi

! #9 (again, first value could be input)
USE: math.parser
1234 number>string [ 1string string>number ] each
