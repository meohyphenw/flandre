---@class flandre.bullet : flandre.sprite, flandre.movable
local bullet = _class('bullet', _class_sprite, _class_movable)

---@alias flandre.bullet.type 'scale'|'ring'|'circle'|'rice'|'sharp'|'prism'|'square'|'ammo'|'long_bacteria'|'star'|'ghost'|'bacteria'
---@alias flandre.bullet.color 'black'|'deep_red'|'red'|'purple'|'pink'|'deep_blue'|'blue'|'deep_cyan'|'cyan'|'deep_green'|'green'|'greenish_yellow'|'deep_yellow'|'yellow'|'golden'|'white'

local COLOR_WHITE = {1, 1, 1}
local COLOR_RED = {240/255, 50/255, 50/255}
local COLOR_PINK = {238/255, 60/255, 235/255}
local COLOR_BLUE = {7/255, 18/255, 243/255}
local COLOR_CYAN = {45/255, 1, 1}
local COLOR_GREEN = {21/255, 245/255, 121/255}
local COLOR_YELLOW = {247/255, 247/255, 72/255}

---@param t flandre.bullet.type
---@param c flandre.bullet.color
function bullet:initialize(t, c, x, y, r)
    _class_sprite.initialize(self, _image.bullet_map1)
    _class_movable.initialize(self)
    self.layer = LAYER_ENEMY_BULLET
    self.x = x or 0
    self.y = y or 0
    self.r = r or 0
    self.ox = 8
    self.oy = 8
    self.bullet_type = t
    self.bullet_color = c
    self.quad = _quad_group.bullet_map1[t .. '_' .. c]
    if c == 'black' then
        self.fog_color = c
        self.fog_color_number = COLOR_WHITE
    elseif c == 'deep_red' or c == 'red' then
        self.fog_color = 'red'
        self.fog_color_number = COLOR_RED
    elseif c == 'purple' or c == 'pink' then
        self.fog_color = 'pink'
        self.fog_color_number = COLOR_PINK
    elseif c == 'deep_blue' or c == 'blue' then
        self.fog_color = 'blue'
        self.fog_color_number = COLOR_BLUE
    elseif c == 'deep_cyan' or c == 'cyan' then
        self.fog_color = 'cyan'
        self.fog_color_number = COLOR_CYAN
    elseif c == 'green' or c == 'greenish_yellow' then
        self.fog_color = 'green'
        self.fog_color_number = COLOR_GREEN
    elseif c == 'deep_yellow' or c == 'yellow' or c == 'golden' then
        self.fog_color = 'yellow'
        self.fog_color_number = COLOR_YELLOW
    elseif c == 'white' then
        self.fog_color = c
        self.fog_color_number = COLOR_WHITE
    end
end

function bullet:before()
    local fog = _newex(_class_sprite, _image.bullet_map1)
    fog.layer = LAYER_ENEMY_BULLET + 1
    fog.quad = _quad_group.bullet_map1
    fog.frame = 'fog_' .. self.fog_color
    fog.x = self.x
    fog.y = self.y
    fog.ox = 16
    fog.oy = 16
    fog.sx = 1.8
    fog.sy = 1.8
    fog.ca = 1
    _tween.to(fog, 0.4, {sx = 0.8, sy = 0.8}):ease('linear'):oncomplete(function ()
        _rmv(fog)
    end)
    _tween.to(fog, 0.2, {ca = 0}):delay(0.2):ease('linear')
end

function bullet:after()
    local fog = _newex(_class_sprite, _image.etbreak)
    fog.layer = LAYER_ENEMY_BULLET + 1
    fog.quad = _quad_group.etbreak
    fog.cr = self.fog_color_number[1]
    fog.cg = self.fog_color_number[2]
    fog.cb = self.fog_color_number[3]
    fog.ca = 0.3
    fog.x = self.x
    fog.y = self.y
    fog.ox = 32
    fog.oy = 32
    _task.new(fog, function (self2)
        for i = 1, 8 do
            fog.frame = i
            _task.wait(2)
        end
        _rmv(fog)
    end)
end

function bullet:update()
    _class_movable.update(self)
end

return bullet