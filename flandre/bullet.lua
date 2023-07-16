---@class flandre.bullet : flandre.sprite
local bullet = _class('bullet', _class_sprite)

---@alias flandre.bullet.type 'scale'|'ring'|'circle'|'rice'|'sharp'|'prism'|'square'|'ammo'|'long_bacteria'|'star'|'ghost'|'bacteria'
---@alias flandre.bullet.color 'black'|'deep_red'|'red'|'purple'|'pink'|'deep_blue'|'blue'|'deep_cyan'|'cyan'|'deep_green'|'green'|'greenish_yellow'|'deep_yellow'|'yellow'|'golden'|'white'

---@param t flandre.bullet.type
---@param c flandre.bullet.color
function bullet:initialize(t, c)
    _class_sprite.initialize(self)
    self.bullet_type = t
    self.bullet_color = c
    self.quad = _quad_group.bullet_map1[t .. '_' .. c]
    if c == 'black' then
        self.fog_color = c
    elseif c == 'deep_red' or c == 'red' then
        self.fog_color = 'red'
    elseif c == 'purple' or c == 'pink' then
        self.fog_color = 'pink'
    elseif c == 'deep_blue' or c == 'deep_blue' then
        self.fog_color = 'blue'
    elseif c == 'deep_cyan' or c == 'cyan' then
        self.fog_color = 'cyan'
    elseif c == 'green' or c == 'greenish_yellow' then
        self.fog_color = 'green'
    elseif c == 'deep_yellow' or c == 'yellow' or c == 'golden' then
        self.fog_color = 'yellow'
    elseif c == 'white' then
         self.fog_color = c
    end
end

return bullet