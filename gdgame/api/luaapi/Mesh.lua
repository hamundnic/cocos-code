
--------------------------------
-- @module Mesh
-- @extend Ref
-- @parent_module cc

--------------------------------
-- build vertex buffer from renderdata
-- @function [parent=#Mesh] restore 
-- @param self
        
--------------------------------
-- get mesh vertex attribute count
-- @function [parent=#Mesh] getMeshVertexAttribCount 
-- @param self
-- @return long#long ret (return value: long)
        
--------------------------------
-- get index format
-- @function [parent=#Mesh] getIndexFormat 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
-- get per vertex size in bytes
-- @function [parent=#Mesh] getVertexSizeInBytes 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
--  get primitive type
-- @function [parent=#Mesh] getPrimitiveType 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
-- get index count
-- @function [parent=#Mesh] getIndexCount 
-- @param self
-- @return long#long ret (return value: long)
        
--------------------------------
-- get vertex buffer
-- @function [parent=#Mesh] getVertexBuffer 
-- @param self
-- @return unsigned int#unsigned int ret (return value: unsigned int)
        
--------------------------------
-- get MeshVertexAttribute by index
-- @function [parent=#Mesh] getMeshVertexAttribute 
-- @param self
-- @param #int idx
-- @return MeshVertexAttrib#MeshVertexAttrib ret (return value: cc.MeshVertexAttrib)
        
--------------------------------
-- get index buffer
-- @function [parent=#Mesh] getIndexBuffer 
-- @param self
-- @return unsigned int#unsigned int ret (return value: unsigned int)
        
--------------------------------
-- has vertex attribute?
-- @function [parent=#Mesh] hasVertexAttrib 
-- @param self
-- @param #int attrib
-- @return bool#bool ret (return value: bool)
        
return nil
