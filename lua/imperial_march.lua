song = require 'notation'

song.set_tempo(100)

song.part{
    G4q, G4q, G4q, Ds4ed, As4s,
    G4q, Ds4ed, As4s, G4h,
    D5q, D5q, D5q, Ds5ed, As4s,
    Fs4q, Ds4ed, As4s, G4h
}

song.part {
    G2q, G2q, G2q, Ds2q,
    G2q, Ds2q, G2q, G2q,
    G2q, G2q, G2q, Ds2q,
    Ds2q, Ds2q, G2q, G2q
}

song.go()