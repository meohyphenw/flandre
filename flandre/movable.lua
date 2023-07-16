---@class flandre.movable : flandre.object
local movable = _class('movable', _class_object)

function movable:initialize()
    _class_object.initialize(self)
    self.vx = 0
    self.vy = 0
    self.is_rtov = false
    self.v = 0
    if not self.r then
        self.r = 0
    end
end

function movable:update()
    self.x = self.x + self.vx
    self.y = self.y + self.vy
    if self.is_rtov then
        self.vx = math.cos(self.r) * self.v
        self.vy = math.sin(self.r) * self.v
    end
end

return movable