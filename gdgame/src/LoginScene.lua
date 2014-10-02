require "Cocos2d"

-- cclog
local cclog = function(...)
    print(string.format(...))
end

--create Class
local LoginScene = class("LoginScene")
LoginScene.__index = LoginScene

function LoginScene.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, LoginScene)
    return target
end
-- end create Class

-- overwrite
function LoginScene:init()
    -- do samething my init()
    
    --init the global var of class
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.winSize = cc.Director:getInstance():getWinSize()
    
    local layer = cc.Layer:create()
    local bg = cc.Sprite:create("login_bg.jpg")
    bg:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    layer:addChild(bg)
    --create button
    local btn0 = cc.MenuItemImage:create("login_btn0.png","login_btn0_select.png")
    btn0:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.14)
    local btn1 = cc.MenuItemImage:create("login_btn1.png","login_btn1_select.png")
    btn1:setPosition(self.origin.x + self.visibleSize.width * 0.3, self.origin.y + self.visibleSize.height * 0.14)
    local btn2 = cc.MenuItemImage:create("login_btn2.png","login_btn2_select.png")
    btn2:setPosition(self.origin.x + self.visibleSize.width * 0.7, self.origin.y + self.visibleSize.height * 0.14)
    --create menu
    local menu = cc.Menu:create(btn0,btn1,btn2)
    menu:setPosition(0,0)
    layer:addChild(menu)
    
    
    local btn0Handle = function ()
        cclog("bnt0 click")
        local ExampleScene = require("ExampleScene")
        local mainScene = ExampleScene.create()
        cc.Director:getInstance():replaceScene(mainScene)
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(btn0,btn0Handle,cc.Handler.MENU_CLICKED)
    
    self:addChild(layer)
    return true
end

--static create object
function LoginScene.create()
    local scene = LoginScene.extend(cc.Scene:create())
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object


return LoginScene