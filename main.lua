flandre = require 'flandre'
local debug_graph = require 'flandre.debugGraph'
local fps_graph = debug_graph:new('fps', 0, 0, 200, 70)

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

function love.load()
    _load_res 'script'
    --_new(_class_player, _image.pl00, _quad_group.pl00_normal, _quad_group.pl00_left, _quad_group.pl00_right, _quad_group.pl00_leftex, _quad_group.pl00_rightex, 3)
end


function love.update(dt)
    flandre.core.update()
    _tween.update(0.0166666667)
    fps_graph:update(dt)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
    fps_graph:draw()
end
