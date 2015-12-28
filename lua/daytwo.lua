-- 7 More Languages in 7 Weeks
-- Lua day two exercises

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

mt = {
    __add = function(a1, a2)
        return concatenate(a1, a2)
    end
}

G_mt = {
    __newindex = function(t, k, v)
        --print("newindex called for key " .. k)
        rawset(t, k, v)
        if type(v) == "table" and getmetatable(v) == nil then
            --z = print("setting metatable")
            setmetatable(v, mt)
        end
    end
}

setmetatable(_G, G_mt)


-- second exercise - see strict.lua changes to strict_write

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



