---用户
user = {}

---机签
user.name = 'unknown'

---等级，用来判断游戏完成度
user.level = 0

---游戏是否通关
user.clear = false

---历史
user.history = {
    hiscore = {},
    stage = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
        [7] = false
    },
    spellcard = {},
    music = {}
}

---当前难度
user.difficulty = 1

---当前关卡
user.stage = 1

return user