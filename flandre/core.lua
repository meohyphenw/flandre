local deep = require 'flandre.deep'
local core = {}

core.object = {}
core.image = {}
core.quad = {}
core.quad_group = {}
core.font = {}
core.sound = {}
core.music = {}

-- _last 全局变量在 core.new 调用时赋值

---`core.new` 函数最后实例化的对象。与LuaSTG不同，此变量不会重复赋值，而是在实例对象时赋值
core.last = nil
core.nilindex = {}

LAYER_DEBUG = 70
LAYER_UI =60
LAYER_ENEMY_BULLET = 50
LAYER_ITEM = 40
LAYER_PLAYER = 30
LAYER_PLATER_BULLET = 20
LAYER_ENEMY = 10
LAYER_BACKGROUND = 0

---获取对象池长度
---@return integer
function core.objlen()
    local len = 0
    for k, v in pairs(core.object) do
        len = len + 1
    end
    return len;
end

---在对象池中实例指定类，返回对象池中该实例对象的键，如果 `c` 不是一个类，则返回0
---@param c flandre.new 类
---@param ... unknown 参数
---@return integer index
function core.new(c, ...)
    if c.new then
        if next(core.nilindex) then
            local index = table.remove(core.nilindex)
            core.object[index] = c:new(...)
            core.last = core.object[index]
            core.last.index = index
            _last = core.last
            if core.last.before then
                core.last:before()
            end
            return index
        else
            table.insert(core.object, c:new(...))
            local l = core.objlen()
            core.last = core.object[l]
            core.last.index = l
            _last = core.last
            if core.last.before then
                core.last:before()
            end
            return l
        end
    else
        return 0
    end
end

---在对象池中实例指定类，返回对象池中该实例对象的引用，如果 `c` 不是一个类，则返回nil
---@param c flandre.new 类
---@param ...unknown
---@return table value
function core.newex(c, ...)
    return core.object[core.new(c, ...)]
end

---在对象池中删除给定对象引用或者索引的对象
---@param o table|integer
function core.rmv(o)
    if type(o) == 'number' then
        if core.object[o].after then
            core.object[o]:after()
        end
        core.object[o] = nil
        table.insert(core.nilindex, o)
    elseif type(o) == 'table' then
        if o.index and o.index > 0 then
            if core.object[o].after then
                core.object[o]:after()
            end
            core.object[o.index] = nil
            table.insert(core.nilindex, o.index)
        end
    end
end

---清空所有对象
---@param f function? 清空后执行的操作
function core.clear(f)
    for k, _ in pairs(core.object) do
        core.rmv(k)
    end
    if f then
        f()
    end
end

---更新
function core.update()
    for _,v in pairs(core.object) do
        if v.update and v.is_using and v.is_active then
            v:update()
        end
    end
end

---绘制
function core.draw()
    for _,v in pairs(core.object) do
        if v.draw and v.is_using and v.is_draw and v.layer then
            deep.queue(v.layer, v.draw, v)
        end
    end
    deep.execute()
end

---加载图像
---@param p string 图像位置
---@param n string 图像名
function core.load_image(p, n)
    core.image[n] = love.graphics.newImage(p)
end

---卸载图像
---@param n string 图像名
function core.unload_image(n)
    core.image[n] = nil
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
function core.load_quad(x, y, w, h, sw, sh, n)
    if type(sw) ~= 'number' then
        core.quad[sh] = love.graphics.newQuad(x, y, w, h, sw:getWidth(), sw:getHeight())
    else
        core.quad[n] = love.graphics.newQuad(x, y, w, h, sw, sh)
    end
end

---卸载切片
---@param n string
function core.unload_quad(n)
    core.quad[n] = nil
end

---加载切片组，以 `x` 为分割次数横向切片
---@param i love.Image 基准图像
---@param x number 分割次数
---@param n string 切片组名
function core.load_quad_group_x(i, x, n)
    local sw = i:getWidth()
    local sh = i:getHeight()
    core.quad_group[n] = {}
    for j = 0, x do
        table.insert(core.quad_group[n], love.graphics.newQuad(j*sw/x, 0, sw/x, sh, sw, sh))
    end
end

---加载切片组，以 `x` 为分割次数纵向切片
---@param i love.Image 基准图像
---@param x number 分割次数
---@param n string 切片组名
function core.load_quad_group_y(i, x, n)
    local sw = i:getWidth()
    local sh = i:getHeight()
    core.quad_group[n] = {}
    for j = 0, x do
        table.insert(core.quad_group[n], love.graphics.newQuad(0, j*sh/x, sw, sh/x, sw, sh))
    end
end

---加载切片组，使用指定表中的数据切片
---@param i love.Image 基准图像
---@param n string 切片组名
---@param t table 包含切片数据的表，表中以 `{x: x坐标, y: y坐标, w: 宽, h: 高, n:名（或序号）}` 顺序排列。例如 `{{0,0,5,5,1}, {5,5,5,5,2}}`
function core.load_quad_group_batch(i, n, t)
    local sw = i:getWidth()
    local sh = i:getHeight()
    core.quad_group[n] = {}
    for _,v in pairs(t) do
        core.quad_group[n][v[5]] = love.graphics.newQuad(v[1], v[2], v[3], v[4], sw, sh)
    end
end

---卸载切片组
---@param n string 
function core.unload_quad_group(n)
    core.quad_group[n] = nil
end

---加载字体
---@param p string 字体位置
---@param n string 字体名
---@param s number 大小
---@param h? "light"|"mono"|"none"|"normal"
function core.load_font(p, n, s, h)
    core.font[n] = love.graphics.newFont(p, s, h)
end

---卸载字体
---@param n string 字体名
function core.unload_font(n)
    core.font[n] = nil
end

---加载音效
---@param p string 音效位置
---@param n string 音效名
function core.load_sound(p, n)
    core.sound[n] = love.audio.newSource(p, 'static')
end

---卸载音效
---@param n string 音效名
function core.unload_sound(n)
    core.sound[n] = nil
end

---设置音效音量
---@param v number 0~1
function core.set_sound_volume(v)
    for _, s in pairs(core.sound) do
        s:setVolume(v)
    end
end

---加载音乐
---@param p string 音乐位置
---@param n string 音乐名
function core.load_music(p, n)
    core.music[n] = love.audio.newSource(p, 'stream')
end

---卸载音乐
---@param n string 音乐名
function core.unload_music(n)
    core.music[n] = nil
end

---设置音效音量
---@param v number 0~1
function core.set_music_volume(v)
    for _, m in pairs(core.music) do
        m:setVolume(v)
    end
end

return core
