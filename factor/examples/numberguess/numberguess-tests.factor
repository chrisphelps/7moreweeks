! Day 2 exercises

USING: examples.numberguess tools.test ;
IN: examples.numberguess.tests

{ "You were too low" } [ 3 4 compare ] unit-test
{ "You were too high" } [ 4 3 compare ] unit-test
{ "You got it" } [ 4 4 compare ] unit-test