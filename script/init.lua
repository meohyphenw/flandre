local skip = true
_load_res 'res.font'
_load_res 'res.background'
_load_res 'res.se'
_load_res 'res.music'
local launch = _newex(_class_object)
_task.new(launch, function ()
    local tip = _newex(_class_text, 'Original: 上海アリス幻楽団')
    if not skip then
        _task.wait(100)
        tip:set_align('l')
        tip.ofy = -20
        tip.font = _font.srcmincho
        tip.is_fmt = true
        tip.txtagn = 'center'
        tip.ca = 0
        _tween.to(tip, 1.5, {ca = 1})
        _task.wait(120)
    end
    _load_res 'res.bullet'
    _load_res 'res.player'
    _load_res 'res.enemy'
    _load_res 'res.item'
    if not skip then
        _task.wait(120)
        _tween.to(tip, 1.5, {ca = 0})
        _task.wait(120)
    end
    dofile 'script/title.lua'
    local mask = _new(_class_sprite)
    _last.layer = LAYER_UI + 1
    _last.draw = function (self)
        love.graphics.setColor(0,0,0,self.ca)
        love.graphics.rectangle("fill", 0, 0, _scn.origin_width(), _scn.origin_height())
    end
    _tween.to(_last, 1, {ca = 0}):oncomplete(function ()
        _rmv(mask)
    end)
    _rmv(tip)
end)
