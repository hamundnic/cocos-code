
--------------------------------
-- @module Sprite3D
-- @extend Node,BlendProtocol
-- @parent_module cc

--------------------------------
-- @overload self, cc.Texture2D         
-- @overload self, string         
-- @function [parent=#Sprite3D] setTexture
-- @param self
-- @param #string texFile

--------------------------------
-- get mesh
-- @function [parent=#Sprite3D] getMesh 
-- @param self
-- @return Mesh#Mesh ret (return value: cc.Mesh)
        
--------------------------------
-- 
-- @function [parent=#Sprite3D] getBlendFunc 
-- @param self
-- @return BlendFunc#BlendFunc ret (return value: cc.BlendFunc)
        
--------------------------------
-- 
-- @function [parent=#Sprite3D] setBlendFunc 
-- @param self
-- @param #cc.BlendFunc blendFunc
        
--------------------------------
-- @overload self, string, string         
-- @overload self, string         
-- @function [parent=#Sprite3D] create
-- @param self
-- @param #string modelPath
-- @param #string texturePath
-- @return Sprite3D#Sprite3D ret (retunr value: cc.Sprite3D)

return nil
