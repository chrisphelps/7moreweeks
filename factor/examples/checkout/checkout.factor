USING: examples.cartitem math math.functions sequences accessors kernel ;
IN: examples.checkout

TUPLE: checkout item-count base-price taxes shipping total-price ;

! calculating counts and prices
: sum ( seq -- n ) 0 [ + ] reduce ;

: cart-item-count ( cart -- count ) [ quantity>> ] map sum ;

: cart-item-price ( cart-item -- price ) [ price>> ] [ quantity>> ] bi * ;

: cart-base-price ( cart -- price ) [ cart-item-price ] map sum ;

! build a checkout from the cart
: <base-checkout> ( item-count base-price -- checkout ) f f f checkout boa ;

: <checkout> ( cart -- checkout ) [ cart-item-count ] [ cart-base-price ] bi <base-checkout> ;

! Taxes
CONSTANT: gst-rate 0.05
CONSTANT: pst-rate 0.09975

: gst-pst ( price -- taxes ) [ gst-rate * ] [ pst-rate * ] bi + ;

: taxes ( checkout taxes-calc -- taxes ) 
    [ dup base-price>> ] dip
    call round >>taxes ; inline

CONSTANT: co-rate 0.08

: simple ( price rate -- taxes ) * ; 

! Shipping
CONSTANT: base-shipping 1.49
CONSTANT: per-item-shipping 1.00

: per-item ( checkout -- shipping ) per-item-shipping * base-shipping + ;

CONSTANT: per-box-shipping 5.00

: per-box ( checkout -- shipping ) 3 / per-box-shipping * ;

: shipping ( checkout shipping-calc -- shipping )
    [ dup item-count>> ] dip
    call round >>shipping ; inline

! Total
: total ( checkout -- total-price )
    dup
    [ base-price>> ] [ taxes>> ] [ shipping>> ] tri + + >>total-price ;

: sample-checkout ( checkout -- checkout )
    [ gst-pst ] taxes
    [ per-item ] shipping
    total ;

: co-per-box ( checkout -- checkout )
    [ co-rate simple ] taxes
    [ per-box ] shipping
    total ;



