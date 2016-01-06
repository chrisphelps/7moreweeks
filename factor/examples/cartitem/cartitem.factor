USING: kernel accessors math ;
IN: examples.cartitem

TUPLE: cart-item name price quantity ;

: <dollar-cart-item> ( name -- cart-item ) 1.00 1 cart-item boa ;

: <one-cart-item> ( -- cart-item ) T{ cart-item { quantity 1 } } ;

: <priced-item> ( price -- cart-item ) "Default item" swap 1 cart-item boa ;

: discount ( cart-item percent -- cart-item ) over price>> swap over * 100 / - >>price ;


