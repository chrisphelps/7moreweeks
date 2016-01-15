-- Elm day 2 exercises
-- solved in online editor

-- easy ex 1:

showBoth pos down = show (toString pos ++ " " ++ toString down)

main = Signal.map2 showBoth Mouse.position Mouse.isDown


-- easy ex 2:

ypos = Signal.sampleOn Mouse.isDown Mouse.y

main = Signal.map show ypos


-- medium ex 1:
-- see drawshapes.elm

-- medium ex 2:
-- import Time exposing (..)
count signal = Signal.foldp (\_ n -> n + 1) 0 signal

main = Signal.map show (count (every second))


-- hard ex 1:
count signal = Signal.foldp (\_ n -> n + 1) 0 signal
decount signal = Signal.foldp (\_ n -> n - 1) 700 signal

leftToRight (w, h) x down = collage w h [ selectShape down (calcx x w) (calcy 500 h) ]

main = Signal.map3 leftToRight 
  Window.dimensions 
  (count (every millisecond) ) 
  Mouse.isDown