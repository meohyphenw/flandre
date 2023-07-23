local is_down = love.keyboard.isDown

_new(_class_drawable_ui, _image.titlebg)

local bgmv = 10
local sev = 10
local is_fullscreen = false
local option = {}
local tempoption = {
    [1] = 1,
    [2] = 1,
    [3] = 1
}

local optionmgr = _newex(_class_object)
optionmgr.useroom = 1
optionmgr.useroption = 1

local function leave(f)
    optionmgr.useroom = 0
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

_task.new(optionmgr, function (self)
    --_music.bg:play()
    --开头停一会防止第一次启动动画出bug
    _task.wait(61)
    while true do
        if is_down('up') then
            if self.useroom == 1 then
                if self.useroption == 3 and not _user.clear then
                    self.useroption = 1
                elseif self.useroption ~= 1 then
                    self.useroption = self.useroption - 1
                else
                    self.useroption = 4
                end
            elseif self.useroom == 2 then
                if self.useroption ~= 1 then
                    self.useroption = self.useroption - 1
                else
                    self.useroption = 3
                end
            elseif self.useroom == 3 then
                if self.useroption ~= 1 then
                    self.useroption = self.useroption - 1
                else
                    self.useroption = 3
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('down') then
            if self.useroom == 1 then
                if self.useroption == 1 and not _user.clear then
                    self.useroption = 3
                elseif self.useroption ~= 4 then
                    self.useroption = self.useroption + 1
                else
                    self.useroption = 1
                end
            elseif self.useroom == 2 then
                if self.useroption ~= 3 then
                    self.useroption = self.useroption + 1
                else
                    self.useroption = 1
                end
            elseif self.useroom == 3 then
                if self.useroption ~= 3 then
                    self.useroption = self.useroption + 1
                else
                    self.useroption = 1
                end
            end
            _sound.select:play()
            _task.wait(8)
        elseif is_down('left') then
            if self.useroom == 3 then
                if self.useroption == 1 then
                    if bgmv ~= 0 then
                        bgmv = bgmv - 1
                    else
                        bgmv = 10
                    end
                    _core.set_music_volume(bgmv/10)
                elseif self.useroption == 2 then
                    if sev ~= 0 then
                        sev = sev - 1
                    else
                        sev = 10
                    end
                    _core.set_sound_volume(sev/10)
                elseif self.useroption == 3 then
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
                if self.useroption == 1 then
                    if bgmv ~= 10 then
                        bgmv = bgmv + 1
                    else
                        bgmv = 0
                    end
                    _core.set_music_volume(bgmv/10)
                elseif self.useroption == 2 then
                    if sev ~= 10 then
                        sev = sev + 1
                    else
                        sev = 0
                    end
                    _core.set_sound_volume(sev/10)
                elseif self.useroption == 3 then
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
                if self.useroption == 1 then
                    tempoption[1] = self.useroption
                    self.useroption = tempoption[2]
                    self.useroom = 2
                    _sound.ok:play()
                elseif self.useroption == 2 then
                    tempoption[1] = self.useroption
                    _sound.ok:play()
                elseif self.useroption == 3 then
                    self.useroom = 3
                    tempoption[1] = self.useroption
                    self.useroption = tempoption[3]
                    _sound.ok:play()
                elseif self.useroption == 4 then
                    leave()
                    _sound.ok:play()
                    _task.wait(60) -- 就是为了这碗醋才包的饺子（指每一个if下都放一个音效播放）
                    love.event.quit()
                end
            elseif self.useroom == 2 then
                _user.stage = self.useroption
                _sound.ok:play()
                leave(function ()
                    _do_script('script.ui.world')
                end)
            end
            _task.wait(8)
        elseif is_down('x') then
            if self.useroom == 1 then
                if self.useroption == 4 then
                    leave()
                    _sound.ok:play()
                    _task.wait(60)
                    love.event.quit()
                else
                    self.useroption = 4
                    _sound.cancel:play()
                end
            elseif self.useroom == 2 then
                tempoption[2] = self.useroption
                self.useroption = tempoption[1]
                self.useroom = 1
                _sound.cancel:play()
            elseif self.useroom == 3 then
                tempoption[3] = self.useroption
                self.useroption = tempoption[1]
                self.useroom = 1
                _sound.cancel:play()
            end
            _task.wait(8)
        end
        coroutine.yield()
    end
end)

option[1] = {}

local optiony1 = {
    [1] = _scn.origin_height() -180,
    [2] = _scn.origin_height() -145,
    [3] = _scn.origin_height() -110,
    [4] = _scn.origin_height() -75
}

local focus1 = _newex(_class_sprite)
focus1.selfroom = optionmgr.useroom
focus1.selfoption = optionmgr.useroption
focus1.layer = LAYER_UI + 1
focus1.tween = nil
focus1.ca = 0
focus1.update = function (self)
    if optionmgr.useroom == 1 then
        self.resulty = optiony1[optionmgr.useroption] + 3
        if self.selfoption ~= optionmgr.useroption then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfoption = optionmgr.useroption
        end
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 1 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optionmgr.useroom
    end
end
focus1.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

---local function define start

---@param room integer
---@param optionn integer
---@param name string
---@param pos number
---@param pos_hide number
---@param speed_in number
---@param speed_out number
local function new_option_bottom(room, optionn, name, pos, pos_hide, speed_in, speed_out)
    option[room][optionn] = _newex(_class_text, name)
    _last:set_align('lb')
    _last.ofy = pos_hide
    _last.font = _font.title
    _last.is_fmt = true
    _last.txtagn = 'center'
    _last.selfroom = optionmgr.useroom
    _last.tween = nil
    _last.update = function (self)
        _class_text.update(self)
        if optionmgr.useroom == room then
            if optionmgr.useroption ~= optionn then
                self.ca = 0.5
            else
                self.ca = 1
            end
        end
        if self.selfroom ~= optionmgr.useroom then
            if self.tween then
                self.tween:stop()
            end
            if optionmgr.useroom == room then
                self.tween = _tween.to(self, speed_in, {ofy = pos})
            else
                self.tween = _tween.to(self, speed_out, {ofy = pos_hide}):ease('quadin')
            end
            self.selfroom = optionmgr.useroom
        end
    end
end

local function new_title(room, name)
    local title = _newex(_class_text, name)
    _last:set_align('lt')
    _last.ofy = -150
    _last.font = _font.title
    _last.is_fmt = true
    _last.txtagn = 'center'
    _last.selfroom = optionmgr.useroom
    _last.tween = nil
    _last.update = function (self)
        _class_text.update(self)
        if self.selfroom ~= optionmgr.useroom then
            if self.tween then
                self.tween:stop()
            end
            if optionmgr.useroom == room then
                _tween.to(self, 0.6, {ofy = 40})
            else
                _tween.to(self, 0.6, {ofy = -150}):ease('quadin')
            end
            self.selfroom = optionmgr.useroom
        end
    end
    return title
end

---@param room integer
---@param optionn integer
---@param name string
---@param pos number
---@param speed_in number
---@param speed_out number
local function new_option_center(room, optionn, name, pos, speed_in, speed_out)
    option[room][optionn] = _newex(_class_text, name)
    _last:set_align('r')
    _last.ofx = 0
    _last.ofy = pos
    _last.font = _font.title
    _last.is_fmt = true
    _last.txtagn = 'center'
    _last.selfroom = optionmgr.useroom
    _last.tween = nil
    _last.update = function (self)
        _class_text.update(self)
        if optionmgr.useroom == room then
            if optionmgr.useroption ~= optionn then
                self.ca = 0.5
            else
                self.ca = 1
            end
        end
        if self.selfroom ~= optionmgr.useroom then
            if self.tween then
                self.tween:stop()
            end
            if optionmgr.useroom == room then
                _tween.to(self, speed_in, {ofx = -_scn.origin_width()})
            else
                _tween.to(self, speed_out, {ofx = 0}):ease('quadin')
            end
            self.selfroom = optionmgr.useroom
        end
    end
end

---local function define end

new_option_bottom(1, 1, 'Start', -180, 150, 0.5, 0.8)
_tween.to(_last, 0.5, {ofy = -180})

new_option_bottom(1, 2, 'Extra', -145, 150, 0.6, 0.7)
_tween.to(_last, 0.6, {ofy = -145})

new_option_bottom(1, 3, 'Config', -110, 150, 0.7, 0.6)
_tween.to(_last, 0.7, {ofy = -110})

new_option_bottom(1, 4, 'Quit', -75, 150, 0.8, 0.5)
_tween.to(_last, 0.8, {ofy = -75}):oncomplete(function ()
    focus1.y = optiony1[optionmgr.useroption] + 3
    focus1.resulty = optiony1[optionmgr.useroption] + 3
    _tween.to(focus1, 0.35, {ca = 0.3})
end)

option[2] = {}

local optiony2 = {
    [1] = _scn.origin_height()/2 -35,
    [2] = _scn.origin_height()/2,
    [3] = _scn.origin_height()/2 + 35
}

room2t = new_title(2, 'Difficulty Select')

focus2 = _newex(_class_sprite)
focus2.selfroom = optionmgr.useroom
focus2.selfoption = optionmgr.useroption
focus2.layer = LAYER_UI + 1
focus2.tween = nil
focus2.ca = 0
focus2.update = function (self)
    if optionmgr.useroom == 2 then
        self.resulty = optiony2[optionmgr.useroption] + 3
        if self.selfoption ~= optionmgr.useroption then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfoption = optionmgr.useroption
        end
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 2 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optionmgr.useroom
    end
end
focus2.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

new_option_center(2, 1, 'Normal', -35, 0.6, 0.6)

new_option_center(2, 2, 'Lunatic', 0, 0.65, 0.65)

new_option_center(2, 3, 'Spasmodic', 35, 0.7, 0.7)

option[3] = {}

local optiony3 = {
    [1] = _scn.origin_height()/2 -35,
    [2] = _scn.origin_height()/2,
    [3] = _scn.origin_height()/2 + 35
}

room3t = new_title(3, 'Config')

focus3 = _newex(_class_sprite)
focus3.selfroom = optionmgr.useroom
focus3.selfoption = optionmgr.useroption
focus3.layer = LAYER_UI + 1
focus3.tween = nil
focus3.ca = 0
focus3.update = function (self)
    if optionmgr.useroom == 3 then
        self.resulty = optiony3[optionmgr.useroption] + 3
        if self.selfoption ~= optionmgr.useroption then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.selfoption = optionmgr.useroption
        end
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 3 then
            self.y = self.resulty
            self.tween = _tween.to(self, 0.35, {ca = 0.3})
        else
            self.tween = _tween.to(self, 0.35, {ca = 0})
        end
        self.selfroom = optionmgr.useroom
    end
end
focus3.draw = function (self)
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
end

--这个页面的选项有些特殊所以就不用new_option_center了

option[3][1] = _newex(_class_text, 'BGM Volume:    ' .. tostring(bgmv*10) .. '%')
_last:set_align('l')
_last.ofx = -680
_last.ofy = -35
_last.font = _font.title
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optionmgr.useroom
_last.selfv = bgmv
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optionmgr.useroom == 3 then
        if optionmgr.useroption ~= 1 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfv ~= bgmv then
        self.selfv = bgmv
        self.content = 'BGM Volume:    ' .. tostring(bgmv*10) .. '%'
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 3 then
            _tween.to(self, 0.6, {ofx = 380})
        else
            _tween.to(self, 0.6, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optionmgr.useroom
    end
end

option[3][2] = _newex(_class_text, 'SE Volume:         ' .. tostring(sev*10) .. '%')
_last:set_align('l')
_last.ofx = -680
_last.ofy = 0
_last.font = _font.title
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optionmgr.useroom
_last.selfv = sev
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optionmgr.useroom == 3 then
        if optionmgr.useroption ~= 2 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfv ~= sev then
        self.selfv = sev
        self.content = 'SE Volume:         ' .. tostring(sev*10) .. '%'
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 3 then
            _tween.to(self, 0.7, {ofx = 380})
        else
            _tween.to(self, 0.7, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optionmgr.useroom
    end
end

option[3][3] = _newex(_class_text, 'Full Screen:         ' .. tostring(is_fullscreen))
_last:set_align('l')
_last.ofx = -680
_last.ofy = 35
_last.font = _font.title
_last.is_fmt = true
_last.txtagn = 'left'
_last.selfroom = optionmgr.useroom
_last.selfbool = is_fullscreen
_last.tween = nil
_last.update = function (self)
    _class_text.update(self)
    if optionmgr.useroom == 3 then
        if optionmgr.useroption ~= 3 then
            self.ca = 0.5
        else
            self.ca = 1
        end
    end
    if self.selfbool ~= is_fullscreen then
        self.selfbool = is_fullscreen
        self.content = 'Full Screen:         ' .. tostring(is_fullscreen)
    end
    if self.selfroom ~= optionmgr.useroom then
        if self.tween then
            self.tween:stop()
        end
        if optionmgr.useroom == 3 then
            _tween.to(self, 0.8, {ofx = 380})
        else
            _tween.to(self, 0.8, {ofx = -680}):ease('quadin')
        end
        self.selfroom = optionmgr.useroom
    end
end
