---玩家
---@class flandre.player : flandre.animation
local player = _class('player', _class_animation)

local is_down = love.keyboard.isDown

function player:initialize(i, n, l, r, lex, rex, delay, speed, speed_slow, shoot, bomb, slow, dead)
    _class_animation.initialize(self)
    self.image = i
    self.anim_normal = n
    self.anim_left = l
    self.anim_right = r
    self.anim_leftex = lex
    self.anim_rightex = rex
    self.is_left = false
    self.is_right = false
    self.delay = delay

    self.speed_straight = math.sqrt(speed^2*2)
    self.speed_slanting = speed
    self.speed_straight_slow = math.sqrt(speed_slow^2*2)
    self.speed_slanting_slow = speed_slow

    self.shoot = shoot or function() end
    self.bomb = bomb or function() end
    self.slow = slow or function() end
    self.dead = dead or function() end
end

function player:update()
    _task.continue(self)
end

function player:draw()
    _class_sprite.draw(self)
end

return player