
-- 7 More Languages in 7 Weeks
-- Lua day one exercises


-- easy exercises
function lastdigit(num)
    return num % 10
end

function ends_in_3(num)
    if lastdigit(num) == 3 then
        return true
    else
        return false
    end
end

function is_prime(num)
    for i = 2, num - 1 do
        if num % i == 0 then
            return false
        end
    end
    return true
end

function first_three()
    local c = 0
    local i = 2
    while c < 3 do
        if is_prime(i) and ends_in_3(i) then
            print(i)
            c = c + 1    
        end
        i = i + 1
    end
end


-- medium exercises
function for_loop(a, b, f)
    local i = a
    while i <= b do
        f(i)
        i = i + 1
    end
end


-- hard exercises
-- order of parameters was specified in the exercise
function reduce(max, init, f)
    local acc = init
    for i = init,max do
        acc = f(acc, i)
    end
    return acc
end

-- provided example combiner
function add(previous, next)
    return previous + next
end

function multiply(previous, next)
    return previous * next
end

function factorial(num)
    return reduce(num, 1, multiply)
end

--[[
Factorial overruns the numeric type over a certain amount
> =factorial(170)
7.257415615308e+306

> =factorial(171)
inf

> a = factorial(170)

> =a * 24
1.7417797476739e+308

> =a * 25
inf
--]]




