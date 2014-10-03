--create Class
local BattleScene = class("BattleScene")
BattleScene.__index = BattleScene

function BattleScene.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, BattleScene)
    return target
end
-- end create Class

-- overwrite
function BattleScene:init()
    -- do samething my init()
    
    local item1 = cc.MenuItemImage:create("main_menu_todolist_1.jpg","main_menu_todolist_2.jpg")
    item1:setPosition(100,100)
    local menu = cc.Menu:create(item1)
    menu:setPosition(0,0)
    self:addChild(menu)

    local item1Handle = function ()
        cc.Director:getInstance():popScene()
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(item1,item1Handle,cc.Handler.MENU_CLICKED)
    
    return true
end

--static create object
function BattleScene.create()
    local scene = BattleScene.extend(cc.Scene:create())
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object


return BattleScene