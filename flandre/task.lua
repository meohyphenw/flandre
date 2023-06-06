local task = {}

---插入任务
---@param func function
function task:new(func)
	if not self.task then
        self.task = {}
    end
    table.insert(self.task, coroutine.create(func))
end

function task:continue()
    if self.task then
        if next(self.task) then --?
            for _, t in pairs(self.task) do
                if coroutine.status(t) ~= "dead" then
                    coroutine.resume(t, self)
                end
            end
        end
    end
end

---等待（协程only）
---@param t integer
function task.wait(t)
    for i = 1, t do
        coroutine.yield()
    end
end

return task