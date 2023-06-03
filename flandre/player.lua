---玩家
---@class flandre.player : flandre.sprite
local player = _class('player', _class_sprite)

function player:initialize()
    _class_sprite.initialize(self)
    self.anim_left = nil
    self.anim_right = nil
    
end

function player:update()
    _task.continue(self)

end

function player:update_anim()
    
end