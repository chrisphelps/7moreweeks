-- 7 More Languages in 7 Weeks
-- Lua strict example

local _private = {}

function strict_read(table, key)
    if _private[key] then
        return _private[key]
    else
        error("Invalid key: " .. key)
    end
end

-- updated in day two exercises
function strict_write(table, key, value)
    if _private[key] then
        if value == nil then
            _private[key] = nil
        else 
            error("Duplicate key: " .. key)
        end
    else
        _private[key] = value
    end
end

local mt = {
    __index = strict_read,
    __newindex = strict_write
}

treasure = {}
setmetatable(treasure, mt)