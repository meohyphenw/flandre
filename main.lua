flandre = require 'flandre'

function love.load()

end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
