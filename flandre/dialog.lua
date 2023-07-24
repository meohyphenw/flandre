---@class flandre.dialog : flandre.interface
local dialog = _class('dialog', _class_interface)

function dialog:initialize()
    _class_interface.initialize(self)
    self.font = nil ---@type nil|love.Font
    self.content = {} ---@type table 文本
    self.time = 0.3
    self.delay = 10
end

---@param c table
function dialog:set_content(c)
    self.content = {}
    for i, v in ipairs(c) do
        table.insert(self.content, {y = self.font:getHeight() * (i - 1), ca = 0, sy = 0, text = v})
    end
end

function dialog:draw()
    love.graphics.setFont(self.font)
    for _, v in ipairs(self.content) do
        love.graphics.setColor(1,1,1,v.ca)
        love.graphics.print(v.text, self.ofx, self.ofy + v.y, 0, 1, v.sy)
    end
end

function dialog:print()
    _task.new(self, function ()
        for _, v in ipairs(self.content) do
            _tween.to(v, self.time, {ca = 1})
            _tween.to(v, self.time, {sy = 1})
            _task.wait(self.delay)
        end
    end)
end

function dialog:change(c)
    self:set_content(c)
    self:print()
end

return dialog