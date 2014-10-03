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

    local s = cc.Sprite:create("res/UI/alpha/VGA/logo.jpg")
    s:setPosition(300,300)
    cc.Director:getInstance():getRunningScene():addChild(s)
    cc.Director:getInstance():getRunningScene():setEnabled(false)

    local getJsonstring = function()
        local xhr = cc.XMLHttpRequest:new()
            xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
            xhr:open("GET", "http://httpbin.org/get")

            local function onReadyStateChange()
            local statusString = "Http Status Code:"..xhr.statusText
            s:removeFromParentAndCleanup(false)
            cc.Director:getInstance():getRunningScene():setEnabled(true)
--                s:removeFromParentAndCleanup()
                print(xhr.response)
            end
            xhr:registerScriptHandler(onReadyStateChange)
            xhr:send()
    end

    getJsonstring()
    local jsonstring = "{\"a\":1}"
    cclog("LoginService-test():" .. jsonstring)
    local json = require("json");
    local loginEntity = json.decode(jsonstring)
    return loginEntity
end

return LoginService