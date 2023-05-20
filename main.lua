flandre = require 'flandre'

function love.load()
    _load_image('www.png', 'www')
    _new(flandre.sprite)
    _last.image = _p.image.www
    _task.new(_last, function ()
        for i = 1, 100 do
            _last.x = _last.x + 1
            coroutine.yield()
        end
    end)
end

function love.update(dt)
    flandre.pool.update(dt)
end

function love.draw()
    flandre.pool.draw()
end
