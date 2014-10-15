
--------------------------------
-- @module PhysicsWorld
-- @parent_module cc

--------------------------------
--  get the gravity value 
-- @function [parent=#PhysicsWorld] getGravity 
-- @param self
-- @return vec2_table#vec2_table ret (return value: vec2_table)
        
--------------------------------
--  Get all the bodys that in the physics world. 
-- @function [parent=#PhysicsWorld] getAllBodies 
-- @param self
-- @return array_table#array_table ret (return value: array_table)
        
--------------------------------
--  set the gravity value 
-- @function [parent=#PhysicsWorld] setGravity 
-- @param self
-- @param #vec2_table gravity
        
--------------------------------
--  get the speed of physics world 
-- @function [parent=#PhysicsWorld] getSpeed 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- @overload self, int         
-- @overload self, cc.PhysicsBody         
-- @function [parent=#PhysicsWorld] removeBody
-- @param self
-- @param #cc.PhysicsBody body

--------------------------------
--  Remove a joint from physics world.
-- @function [parent=#PhysicsWorld] removeJoint 
-- @param self
-- @param #cc.PhysicsJoint joint
-- @param #bool destroy
        
--------------------------------
--  get the update rate 
-- @function [parent=#PhysicsWorld] getUpdateRate 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
--  Set the speed of physics world, speed is the rate at which the simulation executes. default value is 1.0 
-- @function [parent=#PhysicsWorld] setSpeed 
-- @param self
-- @param #float speed
        
--------------------------------
--  Get phsyics shapes that contains the point. 
-- @function [parent=#PhysicsWorld] getShapes 
-- @param self
-- @param #vec2_table point
-- @return array_table#array_table ret (return value: array_table)
        
--------------------------------
--  Remove all joints from physics world.
-- @function [parent=#PhysicsWorld] removeAllJoints 
-- @param self
        
--------------------------------
--  return physics shape that contains the point. 
-- @function [parent=#PhysicsWorld] getShape 
-- @param self
-- @param #vec2_table point
-- @return PhysicsShape#PhysicsShape ret (return value: cc.PhysicsShape)
        
--------------------------------
--  Remove all bodies from physics world. 
-- @function [parent=#PhysicsWorld] removeAllBodies 
-- @param self
        
--------------------------------
--  get the bebug draw mask 
-- @function [parent=#PhysicsWorld] getDebugDrawMask 
-- @param self
-- @return int#int ret (return value: int)
        
--------------------------------
--  set the debug draw mask 
-- @function [parent=#PhysicsWorld] setDebugDrawMask 
-- @param self
-- @param #int mask
        
--------------------------------
--  Get body by tag 
-- @function [parent=#PhysicsWorld] getBody 
-- @param self
-- @param #int tag
-- @return PhysicsBody#PhysicsBody ret (return value: cc.PhysicsBody)
        
--------------------------------
-- set the update rate of physics world, update rate is the value of EngineUpdateTimes/PhysicsWorldUpdateTimes.<br>
-- set it higher can improve performance, set it lower can improve accuracy of physics world simulation.<br>
-- default value is 1.0
-- @function [parent=#PhysicsWorld] setUpdateRate 
-- @param self
-- @param #int rate
        
--------------------------------
--  Adds a joint to the physics world.
-- @function [parent=#PhysicsWorld] addJoint 
-- @param self
-- @param #cc.PhysicsJoint joint
 
	


--------------------------------
-- @function [parent=#PhysicsWorld] getScene 
-- @param self
-- @return Scene#Scene ret (return value: cc.Scene)

--------------------------------
-- @function [parent=#PhysicsWorld] rayCast 
-- @param self
-- @param #int handler
-- @param #point_table arg1
-- @param #point_table arg2

--------------------------------
-- @function [parent=#PhysicsWorld] queryRect 
-- @param self
-- @param #int handler
-- @param #rect_table arg1

--------------------------------
-- @function [parent=#PhysicsWorld] queryPoint 
-- @param self
-- @param #int handler
-- @param #point_table arg1




return nil
