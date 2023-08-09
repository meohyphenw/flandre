---主要用于判定的物理系统的封装
local physics = {}

---@type boolean
physics.is_active = false

---@type love.World
physics.world = love.physics.newWorld()

---创建一个body并绑定到指定的object上（继承自sprite）
---@param obj flandre.sprite
---@param type love.BodyType
function physics.body(obj, type)
    if type then
        obj.body = love.physics.newBody(physics.world, obj.x, obj.y, type)
    else
        obj.body = love.physics.newBody(physics.world, obj.x, obj.y, 'static')
    end
end

---创建一个fixture并绑定到指定的object上（继承自sprite）
---@param obj flandre.sprite
---@param shape love.Shape
---@param density number
function physics.fixture(obj, shape, density)
---@diagnostic disable-next-line: undefined-field
    if obj.body then
---@diagnostic disable-next-line: undefined-field
        love.physics.newFixture(obj.body, shape, density)
    end
end

function physics.update(dt)
    if physics.is_active then
        physics.world:update(dt)
    end
end

return physics