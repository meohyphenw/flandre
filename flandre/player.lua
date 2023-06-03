---玩家
---@class flandre.player : flandre.animation
local player = _class('player', _class_animation)

function player:initialize(n, l, r, lex, rex)
    _class_animation.initialize(self)
    self.anim_normal = n
    self.anim_left = l
    self.anim_right = r
    self.anim_leftex = lex
    self.anim_rightex = rex
end

function player:update(dt)
    _task.continue(self, dt)
    if love.keyboard.isDown('left') then
        self.anim_mode = 'lex'
    elseif love.keyboard.isDown('right') then
        self.anim_mode = 'rex'
    else
        self.anim_mode = 'n'
    end
    _class_animation.update_anim(self)
end

function player:draw()
    _class_sprite.draw(self)
end

return player