--song = require 'notation'

song.set_tempo(100)

song.part{
    G4q1, G4q1, G4q1, Ds4ed1, As4s1,
    G4q2, Ds4ed2, As4s2, G4h2,
    D5q3, D5q3, D5q3, Ds5ed3, As4s3,
    Fs4q, Ds4ed, As4s, G4h
}

song.part {
    G2q1, G2q1, G2q1, Ds2q1,
    G2q1, Ds2q1, G2q1, G2q1,
    G2q1, G2q1, G2q1, Ds2q1,
    Ds2q1, Ds2q1, G2q1, G2q1
}

--song.go()