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
