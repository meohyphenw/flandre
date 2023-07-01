---可以显示图片的interface
---@class flandre.drawable_ui : flandre.interface
local drawable_ui = _class('drawable_ui', _class_interface)

function drawable_ui:initialize(i)
    _class_interface.initialize(self)
    self.image = i
    self.quad = nil
    self.frame = 1
end

function drawable_ui:draw()
    if self.image then
        love.graphics.setColor(self.cr, self.cg, self.cb, self.ca)
        if type(self.quad) == 'nil' then
            love.graphics.draw(self.image, self._x, self._y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        elseif type(self.quad) == 'table' then
            love.graphics.draw(self.image, self.quad[self.frame], self._x, self._y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        else
            love.graphics.draw(self.image, self.quad, self._x, self._y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        end
    end
end

return drawable_ui