_new(_class_unit, _image.titlebg)
local opt = {}
local optmgr = _newex(_class_object)
optmgr.useropt = 1
_task.new(optmgr, function (self)
    while true do
        if love.keyboard.isDown('up') then
            if self.useropt ~= 1 then
                self.useropt = self.useropt - 1
            else
                self.useropt = 3
            end
            _task.wait(8)
        elseif love.keyboard.isDown('down') then
            if self.useropt ~= 3 then
                self.useropt = self.useropt + 1
            else
                self.useropt = 1
            end
            _task.wait(8)
        end
        coroutine.yield()
    end
end)
opt[1] = _newex(_class_text, 'Start')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_tween.to(_last, 0.8, {ofy = -145})
opt[2] = _newex(_class_text, 'Extra')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_tween.to(_last, 0.9, {ofy = -110})
opt[3] = _newex(_class_text, 'Config')
_last:set_align('lb')
_last.ofy = 150
_last.font = _font.gothici
_last.is_fmt = true
_last.txtagn = 'center'
_tween.to(_last, 1, {ofy = -75}):oncomplete(function ()
    local focus = _newex(_class_sprite)
    focus.y = opt[optmgr.useropt]._y + 3
    focus.nowopt = optmgr.useropt
    focus.resulty = opt[optmgr.useropt]._y + 3
    focus.layer = LAYER_UI + 1
    focus.tween = nil
    focus.update = function (self)
        self.resulty = opt[optmgr.useropt]._y + 3
        if self.nowopt ~= optmgr.useropt then
            if self.tween then
                self.tween:stop()
            end
            self.tween = _tween.to(self, 0.25, {y = self.resulty})
            self.nowopt = optmgr.useropt
        end
    end
    focus.draw = function (self)
        love.graphics.setColor(1,1,1,self.ca)
        love.graphics.rectangle("fill", self.x, self.y, _scn.origin_width(), 32)
    end
    focus.ca = 0
    _tween.to(_last, 0.35, {ca = 0.3})
end)
