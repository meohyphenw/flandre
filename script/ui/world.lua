--local o = _newex(_do_script('res.player.paradox_state'), {x = 100, y = 100})
--o:set_content(100)

--[[ local function bullet_group(x, y, r, v, t)
    for i = 1, t do
        local obj = _newex(_class_bullet, 'scale', 'blue', x, y)
        obj.is_rtov = true
        obj.r = math.pi * 2 / t * i + r
        obj.v = v
        _task.new(obj, function (self)
            _task.wait(200)
            _rmv(self)
        end)
    end
end

local obj = _newex(_class_object)
_task.new(obj, function ()
    while true do
        for i = 1, 10 do
            bullet_group(300, 300, i*math.rad(20), 1, 30)
            _task.wait(15)
        end
        _task.wait(30)
    end
end) ]]

local obj2 = _newex(_class_object)
_task.new(obj2, function ()
    --[[ _task.wait(190)
    _clear(function ()
        _newex(_class_bullet, 'scale', 'black', 10, 10).vx = 4
    end) ]]
    while true do
        local obj = _newex(_class_bullet, 'scale', 'blue', 10, 10)
        obj.vx = 2
        _task.new(obj, function (self)
            _task.wait(160)
            _rmv(self)
        end)
        _task.wait(1)
        print(#_core.nilindex)
    end
end)

--_newex(_class_bullet, 'scale', 'black', 10, 10).vx = 4

--print(obj.bullet_type, obj.bullet_color, obj.fog_color)