---玩家
---@class flandre.player : flandre.animation
local player = _class('player', _class_animation)

local is_down = love.keyboard.isDown

function player:initialize(i, n, l, r, lex, rex, delay, speed, speed_slow, shoot, bomb, slow, dead)
    _class_animation.initialize(self, n, l, r, lex, rex)
    self.delay = delay
    self.image = i

    self.speed_straight = math.sqrt(speed^2*2)
    self.speed_slanting = speed
    self.speed_straight_slow = math.sqrt(speed_slow^2*2)
    self.speed_slanting_slow = speed_slow

    self.shoot = shoot or function() end
    self.bomb = bomb or function() end
    self.slow = slow or function() end
    self.dead = dead or function() end
end

function player:before()
    _task.new(self, function ()
        while true do
            _class_animation.update(self)
            _task.wait(self.delay)
        end
    end)
    _task.new(self, function ()
        while true do
            if is_down('left') then
                self:set_anim_mode('l')
                while is_down('left') do
                    coroutine.yield()
                end
                self:set_anim_mode('n')
            elseif is_down('right') then
                self:set_anim_mode('r')
                while is_down('right') do
                    coroutine.yield()
                end
                self:set_anim_mode('n')
            else
                coroutine.yield()
            end
        end
    end)
end

function player:update()
    _task.continue(self)
end

function player:draw()
    _class_sprite.draw(self)
end

return player