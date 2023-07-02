---用户
local user = {}

---机签
user.name = 'unknown'

---等级，用来判断游戏完成度
user.level = 0

---游戏是否通关
user.clear = false

---历史
user.history = {
    hiscore = 0,
    stage = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
        [7] = false
    },
    spellcard = {
        --[[
            spellcard_name = {
                times = 0 -- 0次肯定就是没见过嘛
                accepted = 0
            }
        ]]
    },
    music = {}
}

---当前难度
user.difficulty = 1

---当前关卡
user.stage = 1

user.replay = {
    [1] = {},
}

return user