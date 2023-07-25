--用户
local user = {}

--机签
user.name = 'unknown' ---@type string

--等级，用来判断游戏完成度
user.level = 0 ---@type integer

--游戏是否通关
user.is_clear = true ---@type boolean

--历史
user.history = {
    hiscore = 0,
    stages = {},
    spellcards = {},
    music = {}
}

--回放
user.replays = {}

--当前难度
user.difficulty = 1 ---@type integer

--当前关卡
user.stage = 1 ---@type integer

user.score = 0 ---@type integer

user.lives = 0 ---@type integer

user.bombs = 0 ---@type integer

user.paradox = 0 ---@type integer

user.value = 0 ---@type integer

user.graze = 0 ---@type integer

user.is_paused = false ---@type boolean

function user.finished_stage(n)
    user.history.stages[n] = true
end

---@param n integer
---@param is_ac boolean
function user.finished_spellcard(n, is_ac)
    local target = user.history.spellcards
    if not target[n] then
        target[n] = {}
    end
    if not target[n].times then
        target[n].times = 0
    end
    target[n].times = target[n].times + 1
    if not target[n].accepted then
        target[n].accepted = 0
    end
    if is_ac then
        target[n].accepted = target[n].accepted + 1
    end
end

function user.heard_music(n)
    user.history.music[n] = true
end

return user