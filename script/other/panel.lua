local panel = _class('panel', _class_drawable)

function panel:initialize(bg, chara)
    _class_drawable.initialize(self)
    self.canvas = love.graphics.newCanvas(200,_scn.origin_height()) ---@type love.Canvas
    self.bg_image = bg ---@type love.Image
    self.chara_image = chara ---@type love.Image
    self.ox = self.chara_image:getWidth()/2
    self.oy = self.chara_image:getHeight()/2
    self.bg_image_width = self.bg_image:getWidth()
    self.bg_image_height = self.bg_image:getHeight()
    --self.bg_origin_x = 0
    self.bg_x = 0
    self.bg_ex_x = self.bg_image_width
    self.is_draw_canvas = true
    self.canvas_x = 300
    self.ca = 0
    self.x = 0
    self.y = 0
end

function panel:draw()
    love.graphics.setColor(1, 1, 1, 1)
    if self.is_draw_canvas then
        love.graphics.setCanvas(self.canvas)
        love.graphics.clear()
        love.graphics.draw(self.bg_image, self.bg_x, 0, 0, 1.13, 1.13, 0, 0, -0.3)
        love.graphics.draw(self.bg_image, self.bg_ex_x, 0, 0, 1.13, 1.13, 0, 0, -0.3)
        love.graphics.draw(self.chara_image, self.x, self.y, 0, 1, 1, self.ox, self.oy, -0.3)
        love.graphics.setCanvas()
    end
    love.graphics.setColor(1, 1, 1, self.ca)
    love.graphics.draw(self.canvas, self.canvas_x, 0, 0, 1, 1, 0, 0, 0.3)
end

function panel:update()
    self.bg_x = self.bg_x - 2
    if self.bg_x > -self.bg_image_width then
        self.bg_ex_x = self.bg_x + self.bg_image_width
    else
        self.bg_x = 0
    end
end

function panel:appear(f)
    _tween.to(self, 0.8, {canvas_x = 500}):oncomplete(function ()
        _tween.to(self, 0.5, {canvas_x = 500}):ease('linear'):oncomplete(function ()
            _tween.to(self, 0.7, {canvas_x = 600}):ease('quadin')
        end)
    end)
    _tween.to(self, 0.8, {ca = 1}):oncomplete(function ()
        _tween.to(self, 0.5, {ca = 1}):oncomplete(function ()
            _tween.to(self, 1, {ca = 0}):oncomplete(f)
        end)
    end)
    _tween.to(self, 0.8, {x = 100, y = 300}):oncomplete(function ()
        _tween.to(self, 0.5, {x = 100}):ease('linear'):oncomplete(function ()
            _tween.to(self, 0.8, {x = 300, y = 700}):ease('quadin')
        end)
    end)
end

function panel.spellcard_anim(bg, chara)
    local obj = _newex(panel, bg, chara)
    obj:appear(function ()
        _rmv(obj)
    end)
end

return panel