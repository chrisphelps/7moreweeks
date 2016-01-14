import Graphics.Element exposing (show)
import Mouse
import Window

div x y = show ((toFloat x) / (toFloat y))

count signal = Signal.foldp (\_ n -> n + 1) 0 signal

clickPosition = Signal.sampleOn Mouse.clicks Mouse.position

main = Signal.map2 (div) Mouse.y Window.height