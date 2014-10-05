--create Class
local LoginService = class("LoginService")
local json = require("json");
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
function LoginService:login(callback)
    local request = function(url)
        gd.load()
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
        xhr:open("GET", url)
        local function onReadyStateChange()
            if xhr.status == 200 then
                cclog(xhr.response)
                local entity = json.decode(xhr.response)
                callback(entity)
            else
                cclog("process error:" .. xhr.statusText)
            end
            gd.unload()
        end
        xhr:registerScriptHandler(onReadyStateChange)
        xhr:send()
    end
    
    local requestLocal = function ()
        local jsonstring = cc.FileUtils:getInstance():getStringFromFile("api/login.json")
        cclog(jsonstring)
        local entity = json.decode(jsonstring)
        callback(entity)
    end
    
    local url = "http://httpbin.org/get"
    if gd.debug then
        requestLocal(url)
    else
        request(url)
    end
    
end

return LoginService