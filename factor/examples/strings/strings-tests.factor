! Day 2 exercises

USING: examples.strings tools.test ;
IN: examples.strings.tests

{ t } [ "racecar" palindrome? ] unit-test
{ f } [ "racetrack" palindrome? ] unit-test
