! Day 2 exercises

USING: examples.sequences math tools.test ;
IN: examples.sequences.tests

{ 5 } [ { 1 3 5 } [ 3 > ] find-first ] unit-test
{ f } [ { 1 3 5 } [ 5 > ] find-first ] unit-test
