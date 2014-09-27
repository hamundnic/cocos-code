local scheduler = cc.Director:getInstance():getScheduler()
local kTagLayer = 1

local function createLayerDemoLayer(title, subtitle)
    local layer = cc.Layer:create()
    Helper.initWithLayer(layer)
    local titleStr = title == nil and "No title" or title
    local subTitleStr = subtitle  == nil and "" or subtitle
    Helper.titleLabel:setString(titleStr)
    Helper.subtitleLabel:setString(subTitleStr)
    return layer
end

-- Cascading support extensions

local function setEnableRecursiveCascading(node, enable)
    if node == nil then
        -- cclog("node == nil, return directly")
        return
    end

    if node.setCascadeColorEnabled ~= nil and node.setCascadeOpacityEnabled ~= nil then
        node:setCascadeColorEnabled(enable)
        node:setCascadeOpacityEnabled(enable)
    end

    local obj = nil
    local children = node:getChildren()
    if children == nil then
        -- cclog("children is nil")
        print("children is nil")
        return
    end

    local i = 0
    local len = table.getn(children)
    for i = 0, len-1, 1 do
        setEnableRecursiveCascading(children[i + 1], enable)
    end
end

-- 

function DemoTestMain()
    cclog("DemoTestMain")
    Helper.index = 1
    cc.Director:getInstance():setDepthTest(true)
    local scene = cc.Scene:create()

    Helper.createFunctionTable = {
       
    }
    scene:addChild(CreateBackMenuItem())
    return scene
end
