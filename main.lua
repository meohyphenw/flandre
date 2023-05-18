flandre = require 'flandre'

function love.load()
    obj = _newgt(_class_sprite)
    obj.x = 10
    obj.y = 10
end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
