flandre = require 'flandre'

local function bullet(x, y, r, num)
    for i = 1, num do
        _new(_class_sprite, _image.bullet_map1)
        _last.quad = _quad_group.bullet_map1
        _last.frame = 'scale_red'
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
    require 'flandre.bullet'
    _new(_class_object)
    _task.new(_last, function ()
        for i = 1, 100 do
            bullet(_scn.origin_width()/2,_scn.origin_height()/2,20*i,30)
            _task.wait(15)
        end
    end)
end

function love.update()
    flandre.core.update()
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
