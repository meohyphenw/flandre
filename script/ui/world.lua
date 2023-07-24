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

--[[ local obj2 = _newex(_class_object)
_task.new(obj2, function ()
    --[[ _task.wait(190)
    _clear(function ()
        _newex(_class_bullet, 'scale', 'black', 10, 10).vx = 4
    end) 
    while true do
        local obj = _newex(_class_bullet, 'scale', 'blue', 10, 10)
        obj.vx = 2
        _task.new(obj, function (self)
            _task.wait(160)
            _rmv(self)
        end)
        _task.wait(6)
    end
end) ]]

--_newex(_class_bullet, 'scale', 'black', 10, 10).vx = 4

--print(obj.bullet_type, obj.bullet_color, obj.fog_color)

_new(_class_dialog)
_last.font = _font.sfui
--_last:set_content({'你说得对，但是 中华人民共和国是由工人阶级领导的、', '以工农联盟为基础的人民民主专政的社会主义国家。', '国家成立于1949年10月1日，位于亚洲东部，太平洋西岸。', '在这里，以五星红旗为国旗、《义勇军进行曲》为国歌，国徽', '内容为国旗、天安门、齿轮和麦稻穗，通用语言文字是普通话和规范汉字，', '首都北京。是一个以汉族为主体、56个民族共同组成的统一的多民族国家。', '中国是世界上历史最悠久的国家之一，有着光辉灿烂的文化和光荣的', '的革命传统，世界遗产数量全球领先。1949年新中国成立后，', '进入社会主义革命和建设时期，', '1956年实现向社会主义过渡，此后社会主义建设在探索中曲折发展。', '中国是世界上人口最多的发展中国家，国土面积居世界第三位，', '是世界第二大经济体，', '并持续成为世界经济增长最大的贡献者，2020年经济总量突破100万亿元。', '中国坚持独立自主的和平外交政策，是联合国安全理事会常任理事国，', '也是许多国际组织的重要成员，被认为是潜在超级大国之一。', '同时，逐步为 “中华民族伟大复兴” 而奋斗。'})
--_last:print()
_task.new(_last, function ()
    _last:change({'这是第一段话的第一句', '这是第二句'})
    while not love.keyboard.isDown('z') do
        coroutine.yield()
    end
    _last:change({'这是第二段话的第一句', '这是第二句', '第三句', '仅仅是用来测试哦'})
end)
