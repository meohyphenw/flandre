function love.load()
    flandre = require 'flandre'
    _load_res 'script'
end

function love.update()
    flandre.core.update()
    _tween.update(0.0166666667)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
