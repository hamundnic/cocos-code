
--------------------------------
-- @module SpriteFrameCache
-- @extend Ref
-- @parent_module cc

--------------------------------
-- rename:addSpriteFramesWithFile=addSpriteFrames
-- @overload self, string, string         
-- @overload self, string         
-- @overload self, string, cc.Texture2D         
-- @function [parent=#SpriteFrameCache] addSpriteFrames
-- @param self
-- @param #string plist
-- @param #cc.Texture2D texture

--------------------------------
--  Adds an sprite frame with a given name.<br>
-- If the name already exists, then the contents of the old name will be replaced with the new one.
-- @function [parent=#SpriteFrameCache] addSpriteFrame 
-- @param self
-- @param #cc.SpriteFrame frame
-- @param #string frameName
        
--------------------------------
--  Removes unused sprite frames.<br>
-- Sprite Frames that have a retain count of 1 will be deleted.<br>
-- It is convenient to call this method after when starting a new Scene.
-- @function [parent=#SpriteFrameCache] removeUnusedSpriteFrames 
-- @param self
        
--------------------------------
-- rename:getSpriteFrameByName=getSpriteFrame
--  Returns an Sprite Frame that was previously added.<br>
-- If the name is not found it will return nil.<br>
-- You should retain the returned copy if you are going to use it.<br>
-- js getSpriteFrame<br>
-- lua getSpriteFrame
-- @function [parent=#SpriteFrameCache] getSpriteFrame 
-- @param self
-- @param #string name
-- @return SpriteFrame#SpriteFrame ret (return value: cc.SpriteFrame)
        
--------------------------------
--  Removes multiple Sprite Frames from a plist file.<br>
-- Sprite Frames stored in this file will be removed.<br>
-- It is convenient to call this method when a specific texture needs to be removed.<br>
-- since v0.99.5
-- @function [parent=#SpriteFrameCache] removeSpriteFramesFromFile 
-- @param self
-- @param #string plist
        
--------------------------------
-- 
-- @function [parent=#SpriteFrameCache] init 
-- @param self
-- @return bool#bool ret (return value: bool)
        
--------------------------------
--  Purges the dictionary of loaded sprite frames.<br>
-- Call this method if you receive the "Memory Warning".<br>
-- In the short term: it will free some resources preventing your app from being killed.<br>
-- In the medium term: it will allocate more resources.<br>
-- In the long term: it will be the same.
-- @function [parent=#SpriteFrameCache] removeSpriteFrames 
-- @param self
        
--------------------------------
--  Removes all Sprite Frames associated with the specified textures.<br>
-- It is convenient to call this method when a specific texture needs to be removed.<br>
-- since v0.995.
-- @function [parent=#SpriteFrameCache] removeSpriteFramesFromTexture 
-- @param self
-- @param #cc.Texture2D texture
        
--------------------------------
--  Deletes an sprite frame from the sprite frame cache. 
-- @function [parent=#SpriteFrameCache] removeSpriteFrameByName 
-- @param self
-- @param #string name
        
--------------------------------
--  Destroys the cache. It releases all the Sprite Frames and the retained instance. 
-- @function [parent=#SpriteFrameCache] destroyInstance 
-- @param self
        
--------------------------------
--  Returns the shared instance of the Sprite Frame cache 
-- @function [parent=#SpriteFrameCache] getInstance 
-- @param self
-- @return SpriteFrameCache#SpriteFrameCache ret (return value: cc.SpriteFrameCache)
        
return nil