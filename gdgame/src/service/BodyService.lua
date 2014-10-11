--create Class
local BodyService = class("BodyService", function ()
    return require("service/Service"):create()
end)
local json = require("json");
-- overwrite
function BodyService:init()
    -- do samething my init()
    cclog("BodyService:init")
    return true
end

--static create object
function BodyService:create()
    local service = BodyService:new()
    if nil ~= service then
        service:init()
    end
    return service
end

-- end static create object
function BodyService:acceptBodyData(callback, uid)
    local request = function(url)
        gd.load()
        local xhr = cc.XMLHttpRequest:new()
        xhr.responseType = cc.XMLHTTPREQUEST_RESPONSE_STRING
        xhr.responseType  = cc.XMLHTTPREQUEST_RESPONSE_JSON
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
    local url = self:formatURLString("api/body.json",param)
    cclog(url)
    self:requestLocal(url, callback)
    --    request("http://httpbin.org/get")
    --    request("http://httpbin.org/getError")
end

return BodyService