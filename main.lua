function love.load()
    flandre = require 'flandre'
    _load_resource 'script'
end

function love.update()
    flandre.core.update()
    flandre.tween.update(0.0166666667)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
