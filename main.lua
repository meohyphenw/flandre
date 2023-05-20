flandre = require 'flandre'

function love.load()
    obj = _newex(flandre.object)
    obj.draw = function (self)
---@diagnostic disable-next-line: need-check-nil
        love.graphics.print(tostring(self.index), 10,10)
    end
end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
