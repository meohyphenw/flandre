---动画类，sprite的扩展
---@class flandre.animation : flandre.sprite
local animation = _class('animation', _class_sprite)

---`n` - normal 正常
---`l` - left 左
---`r` - right 右
---`lex` - left_extra 左（过渡用）
---`rex` - right_extra 右（过渡用）

---@alias flandre.animation.state 0 | -1 | 1
---@alias flandre.animation.state_real 0 | -1 | 1 | -2 | 2

---@param n table
---@param l table
---@param r table
---@param lex table
---@param rex table
function animation:initialize(n, l, r, lex, rex)
    _class_sprite.initialize(self)
    self.quad_group = {}
    self.quad_group.n = n
    self.quad_group.l = l
    self.quad_group.r = r
    self.quad_group.lex = lex
    self.quad_group.rex = rex
    self.quad = self.quad_group.n
    self._playing = 0 ---@type flandre.animation.state_real 动画类内部使用
    self._rewind = false ---@type boolean 动画类内部使用
    self._quad_temp = nil ---@type table 动画类内部使用
end

---设置动画状态
---@param m flandre.animation.state
function animation:set_anim_state(m)
    if self._playing ~= m then
        if m == 0 then
            if self._playing == -1 then
                self.quad = self.quad_group.lex
                self.frame = #self.quad
                self._playing = -2
            elseif self._playing == 1 then
                self.quad = self.quad_group.rex
                self.frame = #self.quad
                self._playing = 2
            end
            self._rewind = true
        else
            self.quad = self.quad_group[m .. 'ex']
            self._playing = m .. 'ex'
            if m == -1 then
                self.quad = self.quad_group.lex
                self._playing = -2
            elseif m == 1 then
                self.quad = self.quad_group.rex
                self._playing = 2
            end
            self.frame = 1
        end
    end
end

function animation:update_anim()
    if self._rewind then
        if self.frame == 1 then
            self.quad = self.quad_group.n
            self._playing = 0
            self._rewind = false
        else
            self.frame = self.frame - 1
        end
    else
        if self._playing == -2 or self._playing == 2 then
            if self.frame >= #self.quad then
                if self._playing == -2 then
                    self.quad = self.quad_group.l
                    self._playing = -1
                    self.frame = 1
                else
                    self.quad = self.quad_group.r
                    self._playing = 1
                    self.frame = 1
                end
            else
                self.frame = self.frame + 1
            end
        else
            if self.frame >= #self.quad then
                self.frame = 1
            else
                self.frame = self.frame + 1
            end
        end
    end
end

function animation:update()
    _task.continue(self)
    self:update_anim()
end


return animation