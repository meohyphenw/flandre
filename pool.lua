local pool = {}

pool.object = {}
pool.image = {}
pool.quad = {}
pool.font = {}
pool.sound = {}
pool.music = {}

pool.last = nil
pool.nilindex = {}

function pool.objlen()
    local len = 0
    for k, v in pairs(pool.object) do
        len = len + 1
    end
    return len;
end

function pool.new(c, ...)
    if c.new then
        if next(pool.nilindex) then
            local index = table.remove(pool.nilindex)
            pool.object[index] = c:new(...)
            pool.last.index = index
            return index
        else
            table.insert(pool.object, c:new(...))
            local l = pool.objlen()
            pool.last = pool.object[l]
            pool.last.index = l
            return l
        end
    end
end

function pool.newgt(c)
    return pool.object[pool.new(c)]
end

function pool.rmv(i)
    if type(i) == 'number' then
        pool.object[i] = nil
        table.insert(pool.nilindex, i)
    elseif type(i) == 'table' then
        if i.index and i.index > 0 then
            pool.object[i.index] = nil
            table.insert(pool.nilindex, i.index)
        end
    end
end

function pool.update(dt)
    for k,v in pairs(pool.object) do
        if v.update and v.is_using and v.is_active then
            v:update(dt)
        end
    end
end

function pool.draw()
    for k,v in pairs(pool.object) do
        if v.draw and v.is_using and v.is_draw then
            v:draw()
        end
    end
end

function pool.new_image(p, n)
    pool.image[n] = love.graphics.newImage(p)
end

function pool.rmv_image(n)
    pool.image[n] = nil
end

function pool.new_quad(q, n)

end

function pool.rmv_quad(n)

end

function pool.new_font(p, n)
    pool.font[n] = love.graphics.newFont(p)
end

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