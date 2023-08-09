local debug_script = 'script.other.testscene'
local skip = true

local launch = _newex(_class_object)
_task.new(launch, function ()
    _load_image('res/ui/tip.png', 'tip')
    local tip = _newex(_class_drawable_ui)
    if not skip then
        _task.wait(100)
        tip.image = _image.tip
        tip:set_align('c')
        tip.ox = 288
        tip.oy = 128
        tip.sx = 0.55
        tip.sy = 0.55
        tip.ca = 0
        _tween.to(tip, 1.5, {ca = 1})
        _task.wait(120)
    end
    _load_resource 'res.ui'
    _load_resource 'res.font'
    _load_resource 'res.background'
    _load_resource 'res.se'
    _load_resource 'res.music'
    _load_resource 'res.bullet'
    _load_resource 'res.player'
    _load_resource 'res.enemy'
    _load_resource 'res.item'
    if not skip then
        _task.wait(120)
        _tween.to(tip, 1.5, {ca = 0})
        _task.wait(120)
    end
    if debug_script then
        _do_script(debug_script)
    else
        _do_script 'script.ui.title'
    end
    if not skip then
        local mask = _new(_class_sprite)
        _last.layer = LAYER_UI + 1
        _last.draw = function (self)
            love.graphics.setColor(0,0,0,self.ca)
            love.graphics.rectangle("fill", 0, 0, _scn.origin_width(), _scn.origin_height())
        end
        _tween.to(_last, 1, {ca = 0}):oncomplete(function ()
            _rmv(mask)
        end)
    end
    _rmv(tip)
    _rmv(launch)
end)
