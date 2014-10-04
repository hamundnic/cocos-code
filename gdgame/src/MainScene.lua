--create Class
local MainScene = class("MainScene")
MainScene.__index = MainScene
MainScene._widgets = {}

local LoginService = require("service/LoginService")
local loginService = LoginService:create()

function MainScene.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, MainScene)
    return target
end
-- end create Class

-- overwrite
function MainScene:init()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._origin = cc.Director:getInstance():getVisibleOrigin()

    -- do samething my init()
    local bg1 = cc.Sprite:create("main_bg_sky_left.jpg")
    bg1:setScale(2.689)
    bg1:setAnchorPoint(0,0)
    bg1:setPosition(0,0)
    
    local bg2 = cc.Sprite:create("main_bg_mountain.png")
    bg2:setScale(2.689)
    bg2:setAnchorPoint(0,0)
    bg2:setPosition(0,0)
    
    local  voidNode = cc.ParallaxNode:create()
    voidNode:addChild(bg1, -1, cc.p(0.4,0), cc.p(0,0))
    voidNode:addChild(bg2, 1, cc.p(2.2,0), cc.p(0,0))
    
--    local moveby = cc.MoveBy:create(2.0,cc.p(-300,0))
--    voidNode:runAction(moveby)
    
    self:addChild(voidNode)
    
    local maskSprite = MaskSprite:create("main_bg_grass_left.jpg")
    maskSprite:setMask("main_bg_grass_left_alpha_mask","shader/mask.vsh","shader/mask.fsh")
    maskSprite:setAnchorPoint(0,0)
    maskSprite:setPosition(0,0)
    self:addChild(maskSprite)
    
    local item1 = cc.MenuItemImage:create("main_menu_todolist_1.jpg","main_menu_todolist_2.jpg")
    item1:setPosition(100,100)
    local menu = cc.Menu:create(item1)
    menu:setPosition(0,0)
    self:addChild(menu)
    
    table.insert(self._widgets,menu)
    
    local item1Handle = function ()
--        local s = cc.Sprite:create("logo.jpg")
--        s:setPosition(300,300)
--        cc.Director:getInstance():getRunningScene():addChild(s)
--        cc.Director:getInstance():getRunningScene():setEnabled(false)
        
        local loginCallback = function (entity)
            --update ui
            cclog("origin：" .. entity.origin)
            local Scene = require("BattleScene")
--            local Scene = require("ExampelScene")
            local scene = Scene.create()
            cc.Director:getInstance():pushScene(scene)
        end
        
        local loginEntity = loginService:login(loginCallback)
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(item1,item1Handle,cc.Handler.MENU_CLICKED)
    self:setEnabled(true)
    return true
end

--static create object
function MainScene.create()
    local scene = MainScene.extend(cc.Scene:create())
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object

function MainScene:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
    	widget:setEnabled(enabled)
    end
end

return MainScene