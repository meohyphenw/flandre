local replay = {}

replay.seed = 0
replay.content = {}
replay.markable = {}
replay.frame = 1
replay.frames_number = 0
replay.finished = false

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
    table.insert(replay.markable, player)
end

function replay.update_frames_number()
    replay.frames_number = #replay.content
end

function replay.reset()
    replay.frame = 1
    replay.finished = false
    replay.update_frames_number()
end

function replay.write()
    if not replay.finished then
        replay.content[replay.frame] = {}
        local index = replay.content[replay.frame]
        for i = 1, #replay.markable do -- 神秘的优化方式
            index[i] = {}
            index[i][1] = replay.markable[i].x
            index[i][2] = replay.markable[i].y
            index[i][3] = replay.markable[i].is_shoot
            index[i][4] = replay.markable[i].is_slow
            index[i][5] = replay.markable[i].is_bomb
            index[i][6] = replay.markable[i].is_paradox
        end
        replay.frame = replay.frame + 1
    end
end

function replay.read()
    if not replay.finished then
        local index = replay.content[replay.frame]
        for i = 1, #replay.markable do
            replay.markable[i].x = index[i][1]
            replay.markable[i].y = index[i][2]
            replay.markable[i].is_shoot = index[i][3]
            replay.markable[i].is_slow = index[i][4]
            replay.markable[i].is_bomb = index[i][5]
            replay.markable[i].is_paradox = index[i][6]
        end
        if replay.frame >= replay.frames_number then -- 好好想想为什么会有大于所有帧数量的情况
            replay.finished = true
        else
            replay.frame = replay.frame + 1
        end
    end
end

function replay.update()
    if func then
        func()
    end
end

return replay