---界面的基类
---@class flandre.interface : flandre.object
local interface = _class('interface', _class_object)

---@alias align 'c' | 'l' | 'r' | 't' | 'b' | 'lt'  | 'lb' | 'rt' | 'rb'
-- 对齐方式
-- 'c': 中
-- 'l': 左
-- 'r': 右
-- 't': 上
-- 'b': 下
-- 'lt': 左上
-- 'lb'：左下
-- 'rt': 右上
-- 'rb'：右下

function interface:initialize()
    _class_object.initialize(self)
    self.layer = LAYER_UI
    self.agn = 'lt' ---@type align align
    self.ofx = 0 ---@type number offest x
    self.ofy = 0 ---@type number offest y
    self._x = 0 ---@type number 用于渲染的x坐标，不可更改
    self._y = 0 ---@type number 用于渲染的y坐标，不可更改
    self._rstx = 0 ---@type number result x 用于更新的x对齐，不可更改
    self._rsty = 0 ---@type number result y 用于更新的y对齐，不可更改
    self.cr = 1 ---@type number color red
    self.cg = 1 ---@type number color green
    self.cb = 1 ---@type number color blue
    self.ca = 1 ---@type number color alpha
    self.r = 0 ---@type number rotation
    self.sx = 1 ---@type number scale x
    self.sy = 1 ---@type number scale y
    self.ox = 0 ---@type number origin x
    self.oy = 0 ---@type number origin y
    self.kx = 0 ---@type number
    self.ky = 0 ---@type number
end

function interface:update(dt)
    _task.continue(self, dt)
    self._x = self._rstx + self.ofx
    self._y = self._rsty + self.ofy
end

function interface:update_align()
    if self.agn == 'c' then
        self._rstx = _scn.origin_width()/2 + self.ofx
        self._rsty = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 'l' then
        self._rstx = self.ofx
        self._rsty = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 'r' then
        self._rstx = _scn.origin_width() + self.ofx
        self._rsty = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 't' then
        self._rstx = _scn.origin_width()/2 + self.ofx
        self._rsty = self.ofy
    elseif self.agn == 'b' then
        self._rstx = _scn.origin_width()/2 + self.ofx
        self._rsty = _scn.origin_height() + self.ofy
    elseif self.agn == 'lt' then
        self._rstx = self.ofx
        self._rsty = self.ofy
    elseif self.agn == 'lb' then
        self._rstx = self.ofx
        self._rsty = _scn.origin_height() + self.ofy
    elseif self.agn == 'rt' then
        self._rstx = _scn.origin_width() + self.ofx
        self._rsty = self.ofy
    elseif self.agn == 'rb' then
        self._rstx = _scn.origin_width() + self.ofx
        self._rsty = _scn.origin_height() + self.ofy
    end
end

function interface:set_align(m)
    self.agn = m
    self:update_align()
end

return interface