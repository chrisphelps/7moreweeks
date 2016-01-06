USING: examples.cartitem tools.test kernel accessors ;
IN: examples.cartitem.tests

{ T{ cart-item f f f f } } [ cart-item new ] unit-test
{ T{ cart-item f "Brush" 1.0 1 } } [ "Brush" <dollar-cart-item> ] unit-test
{ T{ cart-item f f f 1 } } [ <one-cart-item> ] unit-test
{ T{ cart-item f f f 5 } } [ cart-item new 5 >>quantity ] unit-test
{ 5 } [ "Book" 4.95 5 cart-item boa quantity>> ] unit-test

{ T{ cart-item f "Default item" 4.95 1 } } [ 4.95 <priced-item> ] unit-test

{ T{ cart-item f f 3.0 f } } [ cart-item new 4.00 >>price 25.0 discount ] unit-test

