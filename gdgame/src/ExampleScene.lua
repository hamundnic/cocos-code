-- cclog
local cclog = function(...)
    print(string.format(...))
end

--create Class
local ExampleScene = class("ExampleScene")
ExampleScene.__index = ExampleScene

function ExampleScene.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, ExampleScene)
    return target
end
-- end create Class

-- overwrite
function ExampleScene:init()
    -- do samething my init()
    return true
end

--static create object
function ExampleScene.create()
    local scene = ExampleScene.extend(cc.Scene:create())
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object


return ExampleScene