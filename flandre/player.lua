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

    --用于replay的状态

    self.is_shoot = false
    self.is_slow = false
    self.is_bomb = false
    self.is_paradox = false
end

function player:before()
    _task.new(self, function ()
        while true do
            if is_down('left') then
                print('set l')
                self:set_anim_state(-1)
                while is_down('left') do
                    coroutine.yield()
                end
                print('set n')
                self:set_anim_state(0)
            end
            if is_down('right') then
                print('set r')
                self:set_anim_state(1)
                while is_down('right') do
                    coroutine.yield()
                end
                print('set n')
                self:set_anim_state(0)
            end
            coroutine.yield()
        end
    end)
    _task.new(self, function ()
        while true do
            _class_animation.update_anim(self)
            _task.wait(self.delay)
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