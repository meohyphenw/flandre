local replay = {}

local finished = false
local frames_number = 0
local frame = 1
local markable = {}
local content = {}
local func = nil

---@param mode 'r' | 'w'
function replay.set_mode(mode)
    if mode == 'r' then
        func = replay.read
    elseif mode == 'w' then
        func = replay.write
    end
end

---@param seed integer
function replay.set_all_seed(seed)
    math.randomseed(seed)
    love.math.setRandomSeed(seed)
end

---标记一个玩家
---@param player flandre.player
function replay.mark(player)
    table.insert(markable, player)
end

function replay.update_frames_number()
    frames_number = #content
end

function replay.reset()
    frame = 1
    finished = false
    replay.update_frames_number()
end

function replay.clear()
    content = {}
end

function replay.write()
    if not finished then
        content[frame] = {}
        local index = content[frame]
        for i = 1, #markable do -- 神秘的优化方式
            index[i] = {}
            index[i][1] = markable[i].x
            index[i][2] = markable[i].y
            index[i][3] = markable[i].is_shoot
            index[i][4] = markable[i].is_slow
            index[i][5] = markable[i].is_bomb
            index[i][6] = markable[i].is_paradox
        end
        frame = frame + 1
    end
end

function replay.read()
    if not finished then
        local index = content[frame]
        for i = 1, #markable do
            markable[i].x = index[i][1]
            markable[i].y = index[i][2]
            markable[i].is_shoot = index[i][3]
            markable[i].is_slow = index[i][4]
            markable[i].is_bomb = index[i][5]
            markable[i].is_paradox = index[i][6]
        end
        if frame >= frames_number then -- 好好想想为什么会有大于所有帧数量的情况
            finished = true
        else
            frame = frame + 1
        end
    end
end

function replay.update()
    if func then
        func()
    end
end

return replay