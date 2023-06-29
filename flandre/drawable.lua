---为了防止某些类没有 `layer` 之类的而不能绘制的情况所以增加了这个，相当于 `sprite` 的简化版
---@class flandre.drawable : flandre.object
local drawable = _class('sprite', _class_object)

function drawable:initialize(i)
    _class_object.initialize(self)
    self.layer = 0
    self.image = i ---@type love.Image | nil
    self.cr = 1 ---@type number color red
    self.cg = 1 ---@type number color green
    self.cb = 1 ---@type number color blue
    self.ca = 1 ---@type number color alpha
    self.x = 0 ---@type number
    self.y = 0 ---@type number
    self.r = 0 ---@type number rotation
    self.sx = 1 ---@type number scale x
    self.sy = 1 ---@type number sclae y
    self.ox = 0 ---@type number origin x
    self.oy = 0 ---@type number origin y
    self.kx = 0 ---@type number
    self.ky = 0 ---@type number
end

function drawable:update()
    _task.continue(self)
end

function drawable:draw()
    love.graphics.setColor(self.cr, self.cg, self.cb, self.ca)
    love.graphics.draw(self.image, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
end

return drawable