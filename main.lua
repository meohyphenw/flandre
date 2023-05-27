flandre = require 'flandre'

function love.load()
    _load_image('flanlogo.png', 'test')
    _load_quad_group_batch(_image.test, {
        {0,0,40,256,1}, {40,0,40,256,2}
    }, 'test')
    _new(_class_sprite, _image.test)
    _last.frame = 2
    _last.quad = _quad_group.test
end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
