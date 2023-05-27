---界面的基类
---@class flandre.interface : flandre.object
local interface = _class('interface', _class_object)

-- 对齐方式对照
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
    self.agn = 'c' ---@type string
    self.ofst = 0 ---@type number
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
end

function interface:draw()
    
end

return interface