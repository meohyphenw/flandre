---@class flandre.sprite : flandre.object
local sprite = _class('sprite', flandre.object)

function sprite:initialize()
    _class_object:initialize()
    self.image = nil
    self.x = 0
    self.y = 0
    self.r = 0
    self.sx = 1
    self.sy = 1
    self.ox = 0
    self.oy = 0
    self.kx = 0
    self.ky = 0
end

function sprite:update()
    _task.continue(self)
end

function sprite:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

return sprite