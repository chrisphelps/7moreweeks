USING: examples.cartitem tools.test kernel accessors ;
IN: examples.cartitem.tests

{ T{ cart-item f f f f } } [ cart-item new ] unit-test
{ T{ cart-item f "Brush" 1.0 1 } } [ "Brush" <dollar-cart-item> ] unit-test
{ T{ cart-item f f f 1 } } [ <one-cart-item> ] unit-test
{ T{ cart-item f f f 5 } } [ cart-item new 5 >>quantity ] unit-test
{ 5 } [ "Book" 4.95 5 cart-item boa quantity>> ] unit-test


