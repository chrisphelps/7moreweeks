-- throttled.elm
-- Elm day 2 hard exercise 2

import Graphics.Element exposing (show)
import Mouse
import Window
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

  
carBottom = filled black (rect 160 50)
carTop = filled black (rect 100 60)
tire = filled red (circle 24)  
  
car: Float -> Float -> Form
car x y = group [
  carBottom
  , carTop |> moveY 30
  , tire |> move (-40, -28)
  , tire |> move (40, -28)
  ] |> move (x, -y)

calcx: Int -> Int -> Float
calcx x w = toFloat x - toFloat w / 2

revcalcx x w = 
  let
    modx = x % w
    dir = x // w % 2 == 0
    fx = toFloat modx
    fw = toFloat w
  in
    if dir then
      fx - fw / 2
    else
      -(fx - fw / 2)
      

calcy: Int -> Int -> Float
calcy y h = toFloat y - toFloat h / 2

speedfactor = 100

speed: Int -> Int
speed x = round (toFloat x / 700 * speedfactor)

count signal = Signal.foldp (\x n -> n + (speed x) * 1) 1 signal


leftToRight (w, h) x = collage w h [ car (revcalcx x w) (calcy 500 h) ]

main = Signal.map2 leftToRight 
  Window.dimensions 
  (count (Signal.sampleOn (fps 5) Mouse.x ))