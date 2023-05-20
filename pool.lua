local pool = {}

pool.object = {}
pool.image = {}
pool.quad = {}
pool.font = {}
pool.sound = {}
pool.music = {}

pool.last = nil
pool.nilindex = {}

---获取对象池长度
---@return integer
function pool.objlen()
    local len = 0
    for k, v in pairs(pool.object) do
        len = len + 1
    end
    return len;
end

---在对象池中实例指定类，如果 `c` 不是一个类，则返回nil
---@param c class 类
---@param ... unknown 参数
---@return integer? 实例对象在对象池中的索引
function pool.new(c, ...)
    if c.new then
        if next(pool.nilindex) then
            local index = table.remove(pool.nilindex)
            pool.object[index] = c:new(...)
            pool.last = pool.object[index]
            pool.last.index = index
            if pool.last.before then
                pool.last:before()
            end
            return index
        else
            table.insert(pool.object, c:new(...))
            local l = pool.objlen()
            pool.last = pool.object[l]
            pool.last.index = l
            if pool.last.before then
                pool.last:before()
            end
            return l
        end
    else
        return nil
    end
end

---在对象池中实例指定类，返回对象池中该实例对象的引用，如果 `c` 不是一个类，则返回nil
---@param c class 类
---@return table? 在对象池中的对象引用
function pool.newex(c)
    return pool.object[pool.new(c)]
end

---在对象池中删除给定对象引用或者索引的对象
---@param o table|integer
function pool.rmv(o)
    if type(o) == 'number' then
        if pool.object[o].after then
            pool.object[o]:after()
        end
        pool.object[o] = nil
        table.insert(pool.nilindex, o)
    elseif type(o) == 'table' then
        if o.index and o.index > 0 then
            if pool.object[o].after then
                pool.object[o]:after()
            end
            pool.object[o.index] = nil
            table.insert(pool.nilindex, o.index)
        end
    end
end

---更新
---@param dt number
function pool.update(dt)
    for k,v in pairs(pool.object) do
        if v.update and v.is_using and v.is_active then
            v:update(dt)
        end
    end
end

---绘制
function pool.draw()
    for k,v in pairs(pool.object) do
        if v.draw and v.is_using and v.is_draw then
            v:draw()
        end
    end
end

---新图像
---@param p string 图像位置
---@param n string 图像名
function pool.new_image(p, n)
    pool.image[n] = love.graphics.newImage(p)
end

---删除图像
---@param n string 图像名
function pool.rmv_image(n)
    pool.image[n] = nil
end

function pool.new_quad(q, n)

end

function pool.rmv_quad(n)

end

---新字体
---@param p string 字体位置
---@param n string 字体名
function pool.new_font(p, n)
    pool.font[n] = love.graphics.newFont(p)
end

---删除字体
---@param n string 字体名
function pool.rmv_font(n)
    pool.font[n] = nil
end

function pool.new_sound(p, n)

end

function pool.rmv_sound(n)

end

function pool.new_music(p, n)

end

function pool.rmv_music(n)

end

return pool