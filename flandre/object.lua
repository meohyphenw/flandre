---基本类
---@class flandre.object : flandre.new
local object = _class('object')

function object:initialize()
    self.is_using = true ---@type boolean 是否可用（相当于同时启用或禁用 `is_active` 与 `is_draw` ）
    self.is_active = true ---@type boolean 是否活动（若为 `true` 则不参与 `core.update` 更新）
    self.is_draw = true ---@type boolean 是否绘制（是否活动（若为 `true` 则不参与 `core.draw` 绘制）
    self.index = 0 ---@type integer 在对象池中的索引（为 `0` 时不存在）
    self.task = {} ---@type table 此对象包含的任务
end

---`_new` 返回前调用此回调，所以在 `_new` 调用后更改此函数就没有用了
function object:before() end

---`_rmv` 删除前调用此回调
function object:after() end

function object:update()
    _task.continue(self)
end

function object:draw() end

return object