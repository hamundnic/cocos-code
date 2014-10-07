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

function Service:formatURLString(api, param)
    local urlstring = gd.rootUrl .. api
	local i = 0
	for key, value in pairs(param) do
        local symbol = "&" 
        if i == 0 then symbol = "?" end
        urlstring = urlstring .. symbol .. key .. "=" .. value
        i = i + 1
	end
	return urlstring
end


return Service