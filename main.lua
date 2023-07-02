
function love.load()
    flandre = require 'flandre'
    _load_res 'script'
    --_new(_class_player, _image.pl00, _quad_group.pl00_normal, _quad_group.pl00_left, _quad_group.pl00_right, _quad_group.pl00_leftex, _quad_group.pl00_rightex, 3)
end

function love.update(dt)
    flandre.core.update()
    _tween.update(0.0166666667)
    flandre.replay.update()
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
