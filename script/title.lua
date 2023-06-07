local is_down = love.keyboard.isDown

_new(_class_unit, _image.titlebg)

local opt = {}
local optmgr = _newex(_class_object)
optmgr.useroom = 1
optmgr.useropt = 1
_task.new(optmgr, function (self)
    --开头给你停一会防止第一次启动动画出bug
    _task.wait(61)
    while true do
        if is_down('up') then
            if self.useroom == 1 then
                if self.useropt ~= 1 then
                    self.useropt = self.useropt - 1
                else
                    self.useropt = 4
                end
            end
            _task.wait(8)
        elseif is_down('down') then
            if self.useroom == 1 then
                if self.useropt ~= 4 then
                    self.useropt = self.useropt + 1
                else
                    self.useropt = 1
                end
            end
            _task.wait(8)
        elseif is_down('z') then
            if self.useroom == 1 then
                if self.useropt == 1 then
                    self.useroom = 2
                elseif self.useropt == 2 then
                    self.useroom = 3
                elseif self.useropt == 3 then
                    self.useroom = 4
                elseif self.useropt == 4 then
                    love.event.quit()
                end
            end
        elseif is_down('x') then
            if self.useroom == 2 or self.useroom == 3 or self.useroom == 4 then
                self.useroom = 1
            end
        end
        coroutine.yield()
    end
end)

opt[1] = {}

--避免focus1获取到错误的y值
local opty1 = {
    [1] = _scn.origin_height() -180,
    [2] = _scn.origin_height() -145,
    [3] = _scn.origin_height() -110,
    [4] = _scn.origin_height() -75
}

local focus1 = _newex(_class_sprite)
focus1.selfroom = optmgr.useroom
focus1.selfopt = optmgr.useropt
focus1.layer = LAYER_UI + 1
focus1.tween = nil
focus1.ca = 0
focus1.update = function (self)
    self.resulty = opty1[optmgr.useropt] + 3
    if self.selfopt ~= optmgr.useropt then
        if self.tween then
            self.tween:stop()
        end
        self.tween = _tween.to(self, 0.25, {y = self.resulty})
        self.selfopt = optmgr.useropt
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 1 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optmgr.useroom
    end
end
focus1.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

opt[1][1] = _newex(_class_text, 'Start')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 1
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useropt ~= 1 then
        self.ca = 0.5
    else
        self.ca = 1
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 1 then
            self.tween = _tween.to(self, 0.5, {ofy = -180})
        else
            self.tween = _tween.to(self, 0.8, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
_tween.to(_last, 0.5, {ofy = -180})

opt[1][2] = _newex(_class_text, 'Extra')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 1
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useropt ~= 2 then
        self.ca = 0.5
    else
        self.ca = 1
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 1 then
            self.tween = _tween.to(self, 0.6, {ofy = -145})
        else
            self.tween = _tween.to(self, 0.7, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
_tween.to(_last, 0.6, {ofy = -145})

opt[1][3] = _newex(_class_text, 'Config')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 1
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useropt ~= 3 then
        self.ca = 0.5
    else
        self.ca = 1
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 1 then
            self.tween = _tween.to(self, 0.7, {ofy = -110})
        else
            self.tween = _tween.to(self, 0.6, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
_tween.to(_last, 0.7, {ofy = -110})

opt[1][4] = _newex(_class_text, 'Quit')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 1
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useropt ~= 4 then
        self.ca = 0.5
    else
        self.ca = 1
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 1 then
            self.tween = _tween.to(self, 0.8, {ofy = -75})
        else
            self.tween = _tween.to(self, 0.5, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
_tween.to(_last, 0.8, {ofy = -75}):oncomplete(function ()
    focus1.y = opty1[optmgr.useropt] + 3
    focus1.resulty = opty1[optmgr.useropt] + 3
    _tween.to(focus1, 0.35, {ca = 0.3})
end)

opt[2] = {}

opt[2][1] = _newex(_class_text, 'This is the room 2!\nPress "X" to return')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 2
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            _tween.to(self, 0.6, {ofy = -_scn.origin_height()/2 - 20})
        else
            _tween.to(self, 0.6, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[3] = {}

opt[3][1] = _newex(_class_text, 'This is the room 3!\nPress "X" to return')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 3
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            _tween.to(self, 0.6, {ofy = -_scn.origin_height()/2 - 20})
        else
            _tween.to(self, 0.6, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[4] = {}

opt[4][1] = _newex(_class_text, 'This is the room 4!\nPress "X" to return')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = 4
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 4 then
            _tween.to(self, 0.6, {ofy = -_scn.origin_height()/2 - 20})
        else
            _tween.to(self, 0.6, {ofy = 150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
