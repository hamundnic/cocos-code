--create Class
local LoginService = class("LoginService", function ()
    return require("service/Service"):create()
end)
local json = require("json");
-- overwrite
function LoginService:init()
    -- do samething my init()
    cclog("LoginService:init")
    return true
end

--static create object
function LoginService:create()
    local service = LoginService:new()
    if nil ~= service then
        service:init()
    end
    return service
end

-- end static create object
function LoginService:login(callback, uid)
    
--    self:test()
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
    
    local param = {["uid"]=uid, ["name"]="hanson"}
    local url = self:formatURLString("api/login.json",param)
    cclog(url)
    self:requestLocal(url, callback)
--    request("http://httpbin.org/get")
end

return LoginService