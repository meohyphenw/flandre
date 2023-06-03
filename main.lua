flandre = require 'flandre'
local debug_graph = require 'flandre.debugGraph'
local fps_graph = debug_graph:new('fps', 0, 0, 200, 70)

function love.load()
    require 'res.font'
    require 'res.bullet'
    require 'res.player'
    require 'res.background'
    _new(_class_unit, _image.titlebg)
    local opt1 = _newex(_class_text, 'Start')
    _last:set_align('lb')
    _last.ofy = 150
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
    _tween.to(_last, 0.8, {ofy = -145})
    local opt2 = _newex(_class_text, 'Extra')
    _last:set_align('lb')
    _last.ofy = 150
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
    _tween.to(_last, 0.9, {ofy = -110})
    local opt3 = _newex(_class_text, 'Config')
    _last:set_align('lb')
    _last.ofy = 150
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
    _tween.to(_last, 1, {ofy = -75}):oncomplete(function ()
        print('new')
        _new(_class_sprite)
        _last.y = opt1._y + 3
        _last.layer = LAYER_UI + 1
        _last.update = function (self, dt)
            self.y = opt1._y + 3
        end
        _last.draw = function (self)
            love.graphics.setColor(1,1,1,0.3)
            love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
        end
    end)
end


function love.update(dt)
    flandre.core.update(dt)
    _tween.update(dt)
    fps_graph:update(dt)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
    fps_graph:draw()
end
