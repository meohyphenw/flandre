---注意：movable仅用于继承，不可直接实例化该类
---@class flandre.movable : flandre.object
local movable = _class('movable', _class_object)

function movable:initialize()
    self.vx = 0
    self.vy = 0
    self.is_rtov = false
    self.v = 0
    if not self.r then
        self.r = 0
    end
end

function movable:update()
    _task.continue(self)
    self.x = self.x + self.vx
    self.y = self.y + self.vy
    if self.is_rtov then
        self.vx = math.cos(self.r) * self.v
        self.vy = math.sin(self.r) * self.v
    end
end

return movable