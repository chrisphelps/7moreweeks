USE: kernel
IN: examples.cartitem

TUPLE: cart-item name price quantity ;

: <dollar-cart-item> ( name -- cart-item ) 1.00 1 cart-item boa ;

: <one-cart-item> ( -- cart-item ) T{ cart-item { quantity 1 } } ;

