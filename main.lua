flandre = require 'flandre'

function love.load()
    _load_image('test.png', 'test')
    _new(_class_sprite, _image.test)
end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
