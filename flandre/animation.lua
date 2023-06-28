---动画类，sprite的扩展
---@class flandre.animation : flandre.sprite
local animation = _class('animation', _class_sprite)

---@alias flandre.animation.animmode 'n' | 'l' | 'r' | 'lex' | 'rex' | nil

function animation:initialize()
    _class_sprite.initialize(self)
    self.delay = 1
    self.anim_normal = nil ---@type table
    self.anim_left = nil ---@type table
    self.anim_right = nil ---@type table
    self.anim_leftex = nil ---@type table 正在向左
    self.anim_rightex = nil ---@type table 正在向右
    self.anim_mode = 'lex' ---@type flandre.animation.animmode
    self.anim_playing = nil ---@type flandre.animation.animmode

    _task.new(self, function ()
        while true do -- 这玩意看着好难受。。。
            _class_animation._continue_anim(self)
            _task.wait(self.delay)
        end
    end)
end

function animation:update()
    _task.continue(self)
end

function animation:_continue_anim()
    if self.anim_mode ~= self.anim_playing then
        if self.anim_mode == 'n' then
            self.anim_playing = 'n'
            self.quad = self.anim_normal
        elseif self.anim_mode == 'l' then
            self.anim_playing = 'l'
            self.quad = self.anim_left
        elseif self.anim_mode == 'r' then
            self.anim_playing = 'r'
            self.quad = self.anim_right
        elseif self.anim_mode == 'lex' then
            self.anim_playing = 'lex'
            self.quad = self.anim_leftex
        elseif self.anim_mode == 'rex' then
            self.anim_playing = 'rex'
            self.quad = self.anim_rightex
        end
    end
    if self.frame >= #self.quad then
        if self.anim_playing == 'lex' then
            self.anim_mode = 'l'
        elseif self.anim_playing == 'rex' then
            self.anim_mode = 'r'
        end
        self.frame = 1
    else
        self.frame = self.frame + 1
    end
end

return animation