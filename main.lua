flandre = require 'flandre'

function love.load()
    _load_image('flanlogo.png', 'flanlogo')
    _new(_class_sprite, _image.flanlogo)
end

function love.update(dt)
    flandre.core.update(dt)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
