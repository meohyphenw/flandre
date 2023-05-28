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
    self.agn = 'lt' ---@type align
    self.ofx = 0 ---@type number
    self.ofy = 0 ---@type number
    self._x = 0 ---@type number 用于渲染的x坐标，不可更改
    self._y = 0 ---@type number 用于渲染的y坐标，不可更改
    self.cr = 1 ---@type number
    self.cg = 1 ---@type number
    self.cb = 1 ---@type number
    self.ca = 1 ---@type number
    self.r = 0 ---@type number
    self.sx = 1 ---@type number
    self.sy = 1 ---@type number
    self.ox = 0 ---@type number
    self.oy = 0 ---@type number
    self.kx = 0 ---@type number
    self.ky = 0 ---@type number
end

function interface:update()
    _task.continue(self)
    if self.agn == 'c' then
        self._x = _scn.origin_width()/2 + self.ofx
        self._y = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 'l' then
        self._x = self.ofx
        self._y = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 'r' then
        self._x = _scn.origin_width() + self.ofx
        self._y = _scn.origin_height()/2 + self.ofy
    elseif self.agn == 't' then
        self._x = _scn.origin_width()/2 + self.ofx
        self._y = self.ofy
    elseif self.agn == 'b' then
        self._x = _scn.origin_width()/2 + self.ofx
        self._y = _scn.origin_height() + self.ofy
    elseif self.agn == 'lt' then
        self._x = self.ofx
        self._y = self.ofy
    elseif self.agn == 'lb' then
        self._x = self.ofx
        self._y = _scn.origin_height() + self.ofy
    elseif self.agn == 'rt' then
        self._x = _scn.origin_width() + self.ofx
        self._y = self.ofy
    elseif self.agn == 'rb' then
        self._x = _scn.origin_width() + self.ofx
        self._y = _scn.origin_height() + self.ofy
    end
end

return interface