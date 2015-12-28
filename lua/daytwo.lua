-- 7 More Languages in 7 Weeks
-- Lua day two exercises

-- easy exercise 1
function concatenate(a1, a2)
    local result = {}

    for i = 1, #a1 do
        result[#result + 1] = a1[i]
    end
    for i = 1, #a2 do
        result[#result + 1] = a2[i]
    end

    return result
end

-- easy exercise 2 - see strict.lua changes to strict_write

-- medium exercise 1
-- new metatable setting the __add function which is called by +
mt = {
    __add = function(a1, a2)
        return concatenate(a1, a2)
    end
}

-- new metatable for the global table. add the mt metatable to all new tables
G_mt = {
    -- t will be _G, key is new var name, v is the new value
    __newindex = function(t, k, v)
        rawset(t, k, v)
        if type(v) == "table" and getmetatable(v) == nil then
            setmetatable(v, mt)
        end
    end
}

-- set metatable on global table
setmetatable(_G, G_mt)


-- medium exercise 2
Queue = {
    arr = {}
}

function Queue:new()
    local obj = {
        arr = self.arr
    }

    setmetatable(obj, self)
    self.__index = self

    return obj    
end

function Queue:add(item)
    self.arr[#self.arr + 1] = item
    return self
end

function Queue:remove()
    local value = self.arr[1]
    for i = 1, #self.arr - 1 do
        self.arr[i] = self.arr[i + 1]
    end
    self.arr[#self.arr] = nil
    return value
end


-- hard exercise
function doit()
    if math.random() > 0.2 then
        coroutine.yield('Something bad happened')
    end

    print('Succeeded')
end

function retry(times, body)
    local i = 1
    local succeeded = false
    while i <= times and succeeded == false do
        local gen = coroutine.create(body)
        suc, val = coroutine.resume(gen)
        if val == nil then -- best check for success?
            succeeded = true
        end
        i = i + 1
    end
    if succeeded == false then
        print('Exceeded number of retries')
    end
end

-- retry(3, doit)
