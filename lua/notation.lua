
local function note(letter, octave)
    local notes = {
        C = 0,
        Cs = 1,
        D = 2,
        Ds = 3,
        E = 4,
        F = 5,
        Fs = 6,
        G = 7,
        Gs = 8,
        A = 9,
        As = 10,
        B = 11
    }

    local notes_per_octave = 12

    return (octave + 1) * notes_per_octave + notes[letter]
end

local tempo = 100

local function duration(value)
    local quarter = 60 / tempo
    local durations = {
        h = 2.0,
        q = 1.0,
        ed = 0.75,
        e = 0.5,
        s = 0.25
    }

    return durations[value] * quarter
end 

local function velocity(value)
    local velocities = {
        0x3f,
        0x5f,
        0x7f 
    }
    local result = velocities[3]

    if value ~= nil and value ~= "" then
        result = velocities[tonumber(value)]
    end
    return result
end

local function parse_note(s)
    local letter, octave, value, volume = string.match(s, "([A-Gs]+)(%d+)(%a+)(%d?)")

    if not (letter and octave and value) then
        return nil
    end

    return {
        note = note(letter, octave),
        duration = duration(value),
        velocity = velocity(volume)
    }
end

local scheduler = require 'scheduler'

local NOTE_DOWN = 0x90
local NOTE_UP = 0x80
local VELOCITY = 0x7f  --7f is highest velocity

local function play(note, duration, velocity)
    midi_send(NOTE_DOWN, note, velocity)
    scheduler.wait(duration)
    midi_send(NOTE_UP, note, velocity)
end

local function part(t)
    local function play_part()
        for i = 1, #t do
            play(t[i].note, t[i].duration, t[i].velocity)
        end
    end

    scheduler.schedule(0.0, coroutine.create(play_part))
end

local mt = {
    __index = function(t, s)
        local result = parse_note(s)
        return result or rawget(t, s)
    end
}

setmetatable(_G, mt)

local function set_tempo(bpm)
    tempo = bpm
end

local function go()
    scheduler.run()
end

return {
    parse_note = parse_note,
    play = play,
    part = part,
    set_tempo = set_tempo,
    go = go
}
