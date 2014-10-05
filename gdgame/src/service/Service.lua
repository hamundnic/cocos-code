--create Class
local Service = class("Service")
-- overwrite
function Service:init()
    -- do something my init()
    return true
end

--static create object
function Service:create()
    local scene = Service.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function Service:ctor()
end

function Service:test()
    cclog("Service:test")
end

function Service:requestLocal(url, callback)
    local jsonstring = cc.FileUtils:getInstance():getStringFromFile("api/login.json")
    cclog(jsonstring)
    local entity = json.decode(jsonstring)
    callback(entity)
end


return Service