local object = _class('object')

function object:initialize()
    self.is_using = true
    self.is_active = true
    self.is_draw = true
    self.index = 0
end

function object:update() end
function object:draw() end

function object:rm()
    _p.rm(self.index)
end

return object