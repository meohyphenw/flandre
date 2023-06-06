---玩家
---@class flandre.player : flandre.animation
local player = _class('player', _class_animation)

function player:initialize(i, n, l, r, lex, rex, t)
    _class_animation.initialize(self)
    self.image = i
    self.anim_normal = n
    self.anim_left = l
    self.anim_right = r
    self.anim_leftex = lex
    self.anim_rightex = rex
    self.is_left = false
    self.is_right = false
    self.time = t
    _task.new(self,function ()
        while true do
            if love.keyboard.isDown('left') then
                self.is_left = true
                coroutine.yield()
                self.is_left = false
                while love.keyboard.isDown('left') do
                    coroutine.yield()
                end
            end
            if love.keyboard.isDown('right') then
                self.is_right = true
                coroutine.yield()
                self.is_right = false
                while love.keyboard.isDown('right') do
                    coroutine.yield()
                end
            end
            coroutine.yield()
        end
    end)
    _task.new(self, function ()
        while true do
            _class_animation.continue_anim(self)
        end
    end)
end

function player:update()
    _task.continue(self)
    if love.keyboard.isDown('left') and self.is_left then
        self.anim_mode = 'lex'
    elseif self.is_right then
        self.anim_mode = 'rex'
    else
        self.anim_mode = 'n'
    end
    print(self.anim_mode)
end

function player:draw()
    _class_sprite.draw(self)
end

return player