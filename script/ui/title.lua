local is_down = love.keyboard.isDown

_new(_class_drawable_ui, _image.titlebg)

local bgmv = 10
local sev = 10
local is_fullscreen = false
local opt = {}
local tempopt = {
    [1] = 1,
    [2] = 1,
    [3] = 1
}

local optmgr = _newex(_class_object)
optmgr.useroom = 1
optmgr.useropt = 1

local function leave(f)
    optmgr.useroom = 0
    local mask = _newex(_class_sprite)
    _last.ca = 0
    _last.layer = LAYER_UI + 1
    _last.draw = function (self)
        love.graphics.setColor(0,0,0,self.ca)
        love.graphics.rectangle("fill", 0, 0, _scn.origin_width(), _scn.origin_height())
    end
    _tween.to(_last, 1, {ca = 1})
    _task.new(mask, function ()
        _task.wait(61)
        _clear(f)
    end)
end

_task.new(optmgr, function (self)
    --_music.bg:play()
    --开头停一会防止第一次启动动画出bug
    _task.wait(61)
    while true do
        if is_down('up') then
            if self.useroom == 1 then
                if self.useropt == 3 and not _user.clear then
                    self.useropt = 1
                elseif self.useropt ~= 1 then
                    self.useropt = self.useropt - 1
                else
                    self.useropt = 4
                end
            elseif self.useroom == 2 then
                if self.useropt ~= 1 then
                    self.useropt = self.useropt - 1
                else
                    self.useropt = 3
                end
            elseif self.useroom == 3 then
                if self.useropt ~= 1 then
                    self.useropt = self.useropt - 1
                else
                    self.useropt = 3
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('down') then
            if self.useroom == 1 then
                if self.useropt == 1 and not _user.clear then
                    self.useropt = 3
                elseif self.useropt ~= 4 then
                    self.useropt = self.useropt + 1
                else
                    self.useropt = 1
                end
            elseif self.useroom == 2 then
                if self.useropt ~= 3 then
                    self.useropt = self.useropt + 1
                else
                    self.useropt = 1
                end
            elseif self.useroom == 3 then
                if self.useropt ~= 3 then
                    self.useropt = self.useropt + 1
                else
                    self.useropt = 1
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('left') then
            if self.useroom == 3 then
                if self.useropt == 1 then
                    if bgmv ~= 0 then
                        bgmv = bgmv - 1
                    else
                        bgmv = 10
                    end
                    _core.set_music_volume(bgmv/10)
                elseif self.useropt == 2 then
                    if sev ~= 0 then
                        sev = sev - 1
                    else
                        sev = 10
                    end
                    _core.set_sound_volume(sev/10)
                elseif self.useropt == 3 then
                    if is_fullscreen == true then
                        is_fullscreen = false
                        love.window.setFullscreen(false)
                    else
                        is_fullscreen = true
                        love.window.setFullscreen(true)
                    end
                    _scn.update('auto')
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('right') then
            if self.useroom == 3 then
                if self.useropt == 1 then
                    if bgmv ~= 10 then
                        bgmv = bgmv + 1
                    else
                        bgmv = 0
                    end
                    _core.set_music_volume(bgmv/10)
                elseif self.useropt == 2 then
                    if sev ~= 10 then
                        sev = sev + 1
                    else
                        sev = 0
                    end
                    _core.set_sound_volume(sev/10)
                elseif self.useropt == 3 then
                    if is_fullscreen == true then
                        is_fullscreen = false
                        love.window.setFullscreen(false)
                    else
                        is_fullscreen = true
                        love.window.setFullscreen(true)
                    end
                    _scn.update('auto')
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('z') then
            if self.useroom == 1 then
                if self.useropt == 1 then
                    tempopt[1] = self.useropt
                    self.useropt = tempopt[2]
                    self.useroom = 2
                    _sound.ok:play()
                elseif self.useropt == 2 then
                    tempopt[1] = self.useropt
                    _sound.ok:play()
                elseif self.useropt == 3 then
                    self.useroom = 3
                    tempopt[1] = self.useropt
                    self.useropt = tempopt[3]
                    _sound.ok:play()
                elseif self.useropt == 4 then
                    leave()
                    _sound.ok:play()
                    _task.wait(60) -- 就是为了这碗醋才包的饺子（指每一个if下都放一个音效播放）
                    love.event.quit()
                end
            elseif self.useroom == 2 then
                _user.stage = self.useropt
                _sound.ok:play()
                leave(function ()
                    _do_script('script.other.testscene')
                end)
            end
            _task.wait(8)
        elseif is_down('x') then
            if self.useroom == 2 then
                tempopt[2] = self.useropt
                self.useropt = tempopt[1]
                self.useroom = 1
            elseif self.useroom == 3 then
                tempopt[3] = self.useropt
                self.useropt = tempopt[1]
                self.useroom = 1
            end
            _sound.cancel:play()
            _task.wait(8)
        end
        coroutine.yield()
    end
end)

opt[1] = {}

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
    if optmgr.useroom == 1 then
        self.resulty = opty1[optmgr.useropt] + 3
        if self.selfopt ~= optmgr.useropt then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfopt = optmgr.useropt
        end
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
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 1 then
        if optmgr.useropt ~= 1 then
            self.ca = 0.5
        else
            self.ca = 1
        end
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
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 1 then
        if optmgr.useropt ~= 2 then
            self.ca = 0.5
        else
            self.ca = 1
        end
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
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 1 then
        if optmgr.useropt ~= 3 then
            self.ca = 0.5
        else
            self.ca = 1
        end
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
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 1 then
        if optmgr.useropt ~= 4 then
            self.ca = 0.5
        else
            self.ca = 1
        end
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

local opty2 = {
    [1] = _scn.origin_height()/2 -35,
    [2] = _scn.origin_height()/2,
    [3] = _scn.origin_height()/2 + 35
}

room2t = _newex(_class_text, 'Difficulty Select')
_last:set_align('lt')
_last.ofy = -150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            _tween.to(self, 0.6, {ofy = 40})
        else
            _tween.to(self, 0.6, {ofy = -150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

focus2 = _newex(_class_sprite)
focus2.selfroom = optmgr.useroom
focus2.selfopt = optmgr.useropt
focus2.layer = LAYER_UI + 1
focus2.tween = nil
focus2.ca = 0
focus2.update = function (self)
    if optmgr.useroom == 2 then
        self.resulty = opty2[optmgr.useropt] + 3
        if self.selfopt ~= optmgr.useropt then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfopt = optmgr.useropt
        end
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optmgr.useroom
    end
end
focus2.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

opt[2][1] = _newex(_class_text, 'Normal')
_last:set_align('r')
_last.ofx = 0
_last.ofy = -35
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 2 then
        if optmgr.useropt ~= 1 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            _tween.to(self, 0.6, {ofx = -_scn.origin_width()})
        else
            _tween.to(self, 0.6, {ofx = 0}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[2][2] = _newex(_class_text, 'Lunatic')
_last:set_align('r')
_last.ofx = 0
_last.ofy = 0
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 2 then
        if optmgr.useropt ~= 2 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            _tween.to(self, 0.65, {ofx = -_scn.origin_width()})
        else
            _tween.to(self, 0.65, {ofx = 0}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[2][3] = _newex(_class_text, 'Spasmodic')
_last:set_align('r')
_last.ofx = 0
_last.ofy = 35
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 2 then
        if optmgr.useropt ~= 3 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 2 then
            _tween.to(self, 0.7, {ofx = -_scn.origin_width()})
        else
            _tween.to(self, 0.7, {ofx = 0}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[3] = {}

local opty3 = {
    [1] = _scn.origin_height()/2 -35,
    [2] = _scn.origin_height()/2,
    [3] = _scn.origin_height()/2 + 35
}

room3t = _newex(_class_text, 'Config')
_last:set_align('lt')
_last.ofy = -150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_last.selfroom = optmgr.useroom
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            _tween.to(self, 0.6, {ofy = 40})
        else
            _tween.to(self, 0.6, {ofy = -150}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

focus3 = _newex(_class_sprite)
focus3.selfroom = optmgr.useroom
focus3.selfopt = optmgr.useropt
focus3.layer = LAYER_UI + 1
focus3.tween = nil
focus3.ca = 0
focus3.update = function (self)
    if optmgr.useroom == 3 then
        self.resulty = opty3[optmgr.useropt] + 3
        if self.selfopt ~= optmgr.useropt then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfopt = optmgr.useropt
        end
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optmgr.useroom
    end
end
focus3.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

opt[3][1] = _newex(_class_text, 'BGM Volume:    ' .. tostring(bgmv*10) .. '%')
_last:set_align('l')
_last.ofx = -680
_last.ofy = -35
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optmgr.useroom
_last.selfv = bgmv
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 3 then
        if optmgr.useropt ~= 1 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfv ~= bgmv then
        self.selfv = bgmv
        self.content = 'BGM Volume:    ' .. tostring(bgmv*10) .. '%'
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            _tween.to(self, 0.6, {ofx = 380})
        else
            _tween.to(self, 0.6, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[3][2] = _newex(_class_text, 'SE Volume:         ' .. tostring(sev*10) .. '%')
_last:set_align('l')
_last.ofx = -680
_last.ofy = 0
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optmgr.useroom
_last.selfv = sev
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 3 then
        if optmgr.useropt ~= 2 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfv ~= sev then
        self.selfv = sev
        self.content = 'SE Volume:         ' .. tostring(sev*10) .. '%'
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            _tween.to(self, 0.7, {ofx = 380})
        else
            _tween.to(self, 0.7, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end

opt[3][3] = _newex(_class_text, 'Full Screen:         ' .. tostring(is_fullscreen))
_last:set_align('l')
_last.ofx = -680
_last.ofy = 35
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optmgr.useroom
_last.selfbool = is_fullscreen
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optmgr.useroom == 3 then
        if optmgr.useropt ~= 3 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfbool ~= is_fullscreen then
        self.selfbool = is_fullscreen
        self.content = 'Full Screen:         ' .. tostring(is_fullscreen)
    end
    if self.selfroom ~= optmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optmgr.useroom == 3 then
            _tween.to(self, 0.8, {ofx = 380})
        else
            _tween.to(self, 0.8, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optmgr.useroom
    end
end
