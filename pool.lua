---池，包括对象，资源等在内
local pool = {}

pool.object = {}
pool.image = {}
pool.quad = {}
pool.quad_group = {}
pool.font = {}
pool.sound = {}
pool.music = {}

-- _last 全局变量在 pool.new 调用时赋值

---`pool.new` 函数最后实例化的对象。与LuaSTG不同，此变量不会重复赋值，而是在实例对象时赋值
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

---在对象池中实例指定类，返回对象池中该实例对象的键，如果 `c` 不是一个类，则返回0
---@param c flandre.class 类
---@param ... unknown 参数
---@return integer index
function pool.new(c, ...)
    if c.new then
        if next(pool.nilindex) then
            local index = table.remove(pool.nilindex)
            pool.object[index] = c:new(...)
            pool.last = pool.object[index]
            pool.last.index = index
            _last = pool.last
            if pool.last.before then
                pool.last:before()
            end
            return index
        else
            table.insert(pool.object, c:new(...))
            local l = pool.objlen()
            pool.last = pool.object[l]
            pool.last.index = l
            _last = pool.last
            if pool.last.before then
                pool.last:before()
            end
            return l
        end
    else
        return 0
    end
end

---在对象池中实例指定类，返回对象池中该实例对象的引用，如果 `c` 不是一个类，则返回nil
---@param c flandre.class 类
---@return table 在对象池中的对象引用
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
    for _,v in pairs(pool.object) do
        if v.update and v.is_using and v.is_active then
            v:update(dt)
        end
    end
end

---绘制
function pool.draw()
    for _,v in pairs(pool.object) do
        if v.draw and v.is_using and v.is_draw then
            v:draw()
        end
    end
end

---加载图像
---@param p string 图像位置
---@param n string 图像名
function pool.load_image(p, n)
    pool.image[n] = love.graphics.newImage(p)
end

---卸载图像
---@param n string 图像名
function pool.unload_image(n)
    pool.image[n] = nil
end

---加载切片
---@param x number x坐标
---@param y number y坐标
---@param w number 宽
---@param h number 高
---@param sw number 基准宽
---@param sh number 基准长
---@param n string 切片名
---@overload fun(x: number, y: number, w: number, h: number, i: love.Image , n: string)
function pool.load_quad(x, y, w, h, sw, sh, n)
    if type(sw) ~= 'number' then
        pool.quad[sh] = love.graphics.newQuad(x, y, w, h, sw:getWidth(), sw:getHeight())
    else
        pool.quad[n] = love.graphics.newQuad(x, y, w, h, sw, sh)
    end
end

---卸载切片
---@param n string
function pool.unload_quad(n)
    pool.quad[n] = nil
end

---加载切片组，以 `x` 为分割次数横向切片
---@param i love.Image 基准图像
---@param x number 分割次数
---@param n string 切片组名
function pool.load_quad_group_x(i, x, n)
    local sw = i:getWidth()
    local sh = i:getHeight()
    pool.quad_group[n] = {}
    for j = 0, x do
        table.insert(pool.quad_group[n], love.graphics.newQuad(j*sw/x, 0, sw/x, sh, sw, sh))
    end
end

---加载切片组，以 `x` 为分割次数纵向切片
---@param i love.Image 基准图像
---@param x number 分割次数
---@param n string 切片组名
function pool.load_quad_group_y(i, x, n)
    local sw = i:getWidth()
    local sh = i:getHeight()
    pool.quad_group[n] = {}
    for j = 0, x do
        table.insert(pool.quad_group[n], love.graphics.newQuad(0, j*sh/x, sw, sh/x, sw, sh))
    end
end

---加载切片组，使用指定表中的数据切片
---@param i love.Image 基准图像
---@param t table 包含切片数据的表，表中以 `{x: x坐标, y: y坐标, w: 宽, h: 高, n:名（或序号）}` 顺序排列。例如 `{{0,0,5,5,1}, {5,5,5,5,2}}`
---@param n string 切片组名
function pool.load_quad_group_batch(i, t, n)
    local sw = i:getWidth()
    local sh = i:getHeight()
    pool.quad_group[n] = {}
    for _,v in pairs(t) do
        pool.quad_group[n][v[5]] = love.graphics.newQuad(v[1], v[2], v[3], v[4], sw, sh)
    end
end

---卸载切片组
---@param n string 
function pool.unload_quad_group(n)
    pool.quad_group[n] = nil
end

---加载字体
---@param p string 字体位置
---@param n string 字体名
function pool.load_font(p, n)
    pool.font[n] = love.graphics.newFont(p)
end

---卸载字体
---@param n string 字体名
function pool.unload_font(n)
    pool.font[n] = nil
end

---加载音效
---@param p string 音效位置
---@param n string 音效名
function pool.load_sound(p, n)
    pool.sound[n] = love.audio.newSource(p, 'static')
end

---卸载音效
---@param n string 音效名
function pool.unload_sound(n)
    pool.sound[n] = nil
end

---加载音乐
---@param p string 音乐位置
---@param n string 音乐名
function pool.load_music(p, n)
    pool.music[n] = love.audio.newSource(p, 'stream')
end

---卸载音乐
---@param n string 音乐名
function pool.unload_music(n)
    pool.music[n] = nil
end

return pool
