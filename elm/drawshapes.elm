-- drawshapes.elm
-- Elm day two medium exercise 1

import Graphics.Element exposing (show)
import Mouse
import Window
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)

bluebox x y = filled blue (rect 50 50) 
  |> moveX x 
  |> moveY -y

redcircle x y = filled red (circle 24)
  |> moveX x
  |> moveY -y

calcx x w = toFloat x - toFloat w / 2
calcy y h = toFloat y - toFloat h / 2

selectShape x y down =
  if down == True then
    redcircle x y
  else
    bluebox x y

draw (x, y) (w, h) down = collage w h [ selectShape (calcx x w) (calcy y h) down ]

showxy (x,y) (w, h) = show (
  toString x ++ " " ++ 
  toString y ++ " " ++
  toString w ++ " " ++
  toString h)

main = Signal.map3 draw Mouse.position Window.dimensions Mouse.isDown