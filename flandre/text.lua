---@class flandre.text : flandre.interface
local text = _class('text', _class_interface)

function text:initialize(c)
    _class_interface.initialize(self)
    self.content = c ---@type string | table
    self.font = nil ---@type love.Font | nil
    self.is_fmt = false ---@type boolean
    self.lmt = _scn.origin_width()
    self.txtagn = 'left' ---@type "center"|"justify"|"left"|"right"
end

function text:draw()
    if self.content then
        love.graphics.setColor(self.cr, self.cg, self.cb, self.ca)
        if self.font then
            love.graphics.setFont(self.font)
        end
        if self.is_fmt then
            love.graphics.printf(self.content, self._x, self._y, self.lmt, self.txtagn, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        else
            love.graphics.print(self.content, self._x, self._y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
        end
    end
end

return text