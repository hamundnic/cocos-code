--create Class
local LoginService = class("LoginService")
LoginService.__index = LoginService

function LoginService.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, LoginService)
    return target
end
-- end create Class

-- overwrite
function LoginService:init()
    -- do samething my init()
    cclog("LoginService:init")
    return true
end

--static create object
function LoginService.create()
    local service = LoginService:new()
    if nil ~= service then
        service:init()
    end
    return service
end
-- end static create object
function LoginService:login()

    local jsonstring = cc.FileUtils:getInstance():getStringFromFile("api/login.json")
    cclog("LoginService-test():" .. jsonstring)
    local json = require("json");
    
    local loginEntity = json.decode(jsonstring)
    return loginEntity
end

return LoginService