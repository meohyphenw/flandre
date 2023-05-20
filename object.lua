---基本类
---@class object : class
local object = _class('object')

function object:initialize()
    self.is_using = true
    self.is_active = true
    self.is_draw = true
    self.index = 0
end

---`_new` 返回前调用此回调
function object:before() end
---`_rmv` 删除前调用此回调（注：不要把协程写在这个地方）
function object:after() end
function object:update() end
function object:draw() end

function object:rm()
    _rmv(self.index)
end

return object