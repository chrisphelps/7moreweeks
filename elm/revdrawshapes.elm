-- revdrawshapes.elm

import Graphics.Element exposing (show)
import Mouse
import Window
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Time exposing (..)

bluebox: Float -> Float -> Form
bluebox x y = filled blue (rect 50 50) 
  |> moveX x 
  |> moveY -y

redcircle: Float -> Float -> Form
redcircle x y = filled red (circle 24)
  |> moveX x
  |> moveY -y

calcx: Int -> Int -> Float
calcx x w = toFloat x - toFloat w / 2

revcalcx x w = 
  let
    dir = x < w
    fx = toFloat x
    fw = toFloat w
  in
    if dir then
      fx - fw / 2
    else
      -(fx - fw - fw / 2)
      

calcy: Int -> Int -> Float
calcy y h = toFloat y - toFloat h / 2

selectShape: Bool -> Float -> Float -> Form
selectShape down = 
  if down then
    redcircle
  else
    bluebox

draw: (Int, Int) -> (Int, Int) -> Bool -> Element
draw (x, y) (w, h) down = collage w h [ selectShape down (calcx x w) (calcy y h) ]

showxy: (Int, Int) -> (Int, Int) -> Element
showxy (x,y) (w, h) = show (
  toString x ++ " " ++ 
  toString y ++ " " ++
  toString w ++ " " ++
  toString h)

count signal = Signal.foldp (\_ n -> n + 1) 0 signal
decount signal = Signal.foldp (\_ n -> n - 1) 700 signal

switchcount signal down = Signal.foldp 
  (\_ n ->
    if down then n + 1
    else n - 1)
  0 signal


leftToRight (w, h) x down = collage w h [ selectShape down (revcalcx x w) (calcy 500 h) ]


main = Signal.map3 leftToRight 
  Window.dimensions 
  (count (every millisecond) ) 
  Mouse.isDown