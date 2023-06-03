---精灵类
---@class flandre.sprite : flandre.object
local sprite = _class('sprite', _class_object)

---判定形状（圆形或矩形）
---@alias flandre.sprite.shape 'c' | 'r'

---@param i? love.Image
function sprite:initialize(i)
    _class_object.initialize(self)
    self.layer = 0
    self.image = i ---@type love.Image | nil
    self.quad = nil ---@type love.Quad | table
    self.frame = 1 ---@type integer | string
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

function sprite:update(dt)
    _task.continue(self, dt)
end

function sprite:draw()
    if self.image then
        love.graphics.setColor(self.cr, self.cg, self.cb, self.ca)
        if type(self.quad) == 'nil' then
            love.graphics.draw(self.image, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        elseif type(self.quad) == 'table' then
            love.graphics.draw(self.image, self.quad[self.frame], self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        else
            love.graphics.draw(self.image, self.quad, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        end
    end
end

return sprite