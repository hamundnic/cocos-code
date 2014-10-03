--create Class
local Service = class("Service")
Service.__index = Service

function Service.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, Service)
    return target
end
-- end create Class

-- overwrite
function Service:init()
    -- do samething my init()
    return true
end

--static create object
function Service.create()
    local scene = Service.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object


return Service