USING: examples.checkout examples.cartitem tools.test kernel arrays ;
IN: examples.checkout.tests

: <sample-cart> ( -- cart )
    "7lang2" 24.99 2 cart-item boa
    "noderw" 10.99 1 cart-item boa
    2array ;

{ T{ checkout f 3 60.97 9.13 4.49 74.59 } } [ <sample-cart> <checkout> sample-checkout ] unit-test

{ T{ checkout f 3 60.97 4.87 5.00 70.84 } } [ <sample-cart> <checkout> co-per-box ] unit-test
