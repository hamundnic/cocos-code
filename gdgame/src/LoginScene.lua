require "Cocos2d"

--create Class
local LoginScene = class("LoginScene", function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function LoginScene:init()
    -- do samething my init()
    local layer = cc.Layer:create()
    local bg = cc.Sprite:create("ui/login_bg.jpg")
    bg:setPosition(self._centerPoint)
    layer:addChild(bg)
    --create button
    local btn0 = cc.MenuItemImage:create("ui/login_btn0.png","ui/login_btn0_select.png")
    btn0:setPosition(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.14)
    local btn1 = cc.MenuItemImage:create("ui/login_btn1.png","ui/login_btn1_select.png")
    btn1:setPosition(self._visibleOrigin.x + self._visibleSize.width * 0.3, self._visibleOrigin.y + self._visibleSize.height * 0.14)
    local btn2 = cc.MenuItemImage:create("ui/login_btn2.png","ui/login_btn2_select.png")
    btn2:setPosition(self._visibleOrigin.x + self._visibleSize.width * 0.7, self._visibleOrigin.y + self._visibleSize.height * 0.14)
    --create menu
    local menu = cc.Menu:create(btn0,btn1,btn2)
    menu:setPosition(0,0)
    layer:addChild(menu)
    
    local btn0Handle = function ()
        cclog("bnt0 click")
        local MainScene = require("MainScene")
        local mainScene = MainScene:create()
        cc.Director:getInstance():replaceScene(mainScene)
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(btn0,btn0Handle,cc.Handler.MENU_CLICKED)
    self:addChild(layer)
    
    local bgLayer = gd.createLayerBg(true,true)
    self:addChild(bgLayer)
    
    
--    local customClass = ct.CustomClass:create()
--    local msg = customClass:helloMsg()
--    cclog("customClass's msg is : " .. msg)
    
    local customClass = ct.CustomClass:create()
    local msg = customClass:helloMsg()
    cclog("customClass's msg is : " .. msg)    
        
    return true
end

--create object
function LoginScene:create()
    local scene = LoginScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function LoginScene:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end

--set Scene which is Touched
function LoginScene:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end
return LoginScene