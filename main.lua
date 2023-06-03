flandre = require 'flandre'

local function bullet(x, y, r, num)
    for i = 1, num do
        _new(_class_sprite, _image.bullet_map1)
        _last.quad = _quad_group.bullet_map1
        _last.frame = 'circle_blue'
        _last.ox = 8
        _last.oy = 8
        _last.r = r*math.pi/180 + 360/num*i*math.pi/180
        _last.speed = 0.5
        _last.x = x
        _last.y = y
        _last.update = function (self)
            self.x = self.x + math.cos(self.r) * self.speed
            self.y = self.y + math.sin(self.r) * self.speed
        end
    end
end
-- Memory Lost in the Galaxy
function love.load()
    require 'res.font'
    require 'res.bullet'
    require 'res.player'
    require 'res.background'
    --[[ _new(_class_object)
    _task.new(_last, function ()
        for i = 1, 17 do
            bullet(_scn.origin_width()/2,_scn.origin_height()/2,20*i,30)
            _task.wait(15)
        end
    end) ]]
    --_new(_class_player, _quad_group.pl00_normal, _quad_group.pl00_left, _quad_group.pl00_right, _quad_group.pl00_leftex, _quad_group.pl00_rightex)
    --_last.image = _image.pl00
    _new(_class_sprite, _image.titlebg)
    _new(_class_text, 'Start')
    _last:set_align('lb')
    _last.ofy = -105 - 40
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
    _new(_class_text, 'Extra')
    _last:set_align('lb')
    _last.ofy = -70 - 40
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
    _new(_class_text, 'Config')
    _last:set_align('lb')
    _last.ofy = -35 - 40
    _last.font = _font.gothici
    _last.is_fmt = true
    _last.txtagn = 'center'
end

function love.update()
    flandre.core.update()
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
