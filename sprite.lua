local sprite = _class('sprite', _class_object)

function sprite:initialize()
    _class_object:initialize()
    self.image = nil
    self.x = 0
    self.y = 0
end

function sprite:update(dt) end
function sprite:draw()
    love.graphics.print('sprite', self.x, self.y)
end

return sprite