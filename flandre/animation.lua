---动画类，sprite的扩展
---@class flandre.animation : flandre.sprite
local animation = _class('animation', _class_sprite)

---`n` - normal 正常
---`l` - left 左
---`r` - right 右
---`lex` - left_extra 左（过渡用）
---`rex` - right_extra 右（过渡用）

---@alias flandre.animation.mode 'n' | 'l' | 'r'
---@alias flandre.animation.mode_real 'n' | 'l' | 'r' | 'lex' | 'rex'

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
    self._playing = 'n' ---@type flandre.animation.mode_real
    self._rewind = false
end

---设置动画模式
---@param m flandre.animation.mode
function animation:set_anim_mode(m)
    if m == 'n' then
        self.quad = self.quad_group.n
        self._playing = 'n'
    else
        self.quad = self.quad_group[m .. 'ex']
        self._playing = m .. 'ex'
        self._rewind = true
    end
    self.frame = 1
end

function animation:update_anim()
    if self._playing == 'lex' or self._playing == 'rex' then
        if self.frame >= #self.quad then
            if self._playing == 'lex' then
                self.quad = self.quad_group.l
                self._playing = 'l'
            else
                self.quad = self.quad_group.r
                self._playing = 'r'
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

function animation:update()
    _task.continue(self)
    self:update_anim()
end


return animation