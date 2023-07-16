--local o = _newex(_do_script('res.player.paradox_state'), {x = 100, y = 100})
--o:set_content(100)

local function bullet_group(x, y, r, v, t)
    for i = 1, t do
        local obj = _newex(_class_bullet, 'scale', 'black', x, y)
        obj.is_rtov = true
        obj.r = math.pi * 2 / t * i + r
        obj.v = v
    end
end

local obj = _newex(_class_object)
_task.new(obj, function ()
    for i = 1, 10 do
        bullet_group(300, 300, i*math.rad(20), 1, 30)
        _task.wait(15)
    end
end)

local obj2 = _newex(_class_object)
_task.new(obj2, function ()
    _task.wait(190)
    _clear()
end)

--print(obj.bullet_type, obj.bullet_color, obj.fog_color)