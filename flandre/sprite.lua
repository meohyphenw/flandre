---精灵类
---@class flandre.sprite : flandre.object
local sprite = _class('sprite', _class_object)

---@param i love.Image
function sprite:initialize(i)
    _class_object.initialize(self)
    self.image = i ---@type love.Image
    self.quad = nil ---@type love.Quad | table
    self.frame = 1 ---@type integer | string
    self.cr = 1 ---@type number
    self.cg = 1 ---@type number
    self.cb = 1 ---@type number
    self.ca = 1 ---@type number
    self.x = 0 ---@type number
    self.y = 0 ---@type number
    self.r = 0 ---@type number
    self.sx = 1 ---@type number
    self.sy = 1 ---@type number
    self.ox = 0 ---@type number
    self.oy = 0 ---@type number
    self.kx = 0 ---@type number
    self.ky = 0 ---@type number
end

function sprite:update()
    _task.continue(self)
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