local paradox_state = _class('circle', _class_object)

local is_down = love.keyboard.isDown

function paradox_state:initialize(player)
    _class_object.initialize(self)
    self._content = 0
    self.font = _font.deng ---@type love.Font
    self.distance = 50
    self.r = 0
    self.x = 0
    self.y = 0
    self.layer = 0
    self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = '0', [8] = '%'}
    self.ox = {}
    for k, v in pairs(self.words) do
        self.ox[k] = self.font:getWidth(v)/2
    end
    self.number = 9
    self.tween1 = nil
    self.tween2 = nil
    self.is_down = false
    self.speed = -0.03
    self.ca = 0.25
    self.target_player = player or {x = 0, y = 0}
end

function paradox_state:update_words()
    if self._content < 10 then
        self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = tostring(self._content), [8] = '%'}
        self.number = 9
    elseif self._content < 100 then
        self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = tostring(math.floor(self._content/10)), [8] = tostring(self._content%10), [9] = '%'}
        self.number = 10
    elseif self._content == 100 then
        self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = '1', [8] = '0', [9] = '0', [10] = '%'}
        self.number = 11
    end
    for k, v in pairs(self.words) do
        self.ox[k] = self.font:getWidth(v)/2
    end
end

---@param v integer
function paradox_state:set_content(v)
    self._content = v
    self:update_words()
end

function paradox_state:update()
    self.x = self.target_player.x
    self.y = self.target_player.y
    self.r = self.r + self.speed
    if is_down('lshift') then
        if not self.is_down then
            if self.tween1 then
                self.tween1:stop()
            end
            if self.tween2 then
                self.tween2:stop()
            end
            self.tween1 = _tween.to(self, 0.2, {distance = 36})
            self.tween2 = _tween.to(self, 0.2, {ca = 0.8})
            self.speed = -0.02
            self.is_down = true
        end
    else
        if self.is_down then
            if self.tween1 then
                self.tween1:stop()
            end
            if self.tween2 then
                self.tween2:stop()
            end
            self.tween1 = _tween.to(self, 0.2, {distance = 50})
            self.tween2 = _tween.to(self, 0.2, {ca = 0.25})
            self.speed = -0.03
            self.is_down = false
        end
    end
end

function paradox_state:draw()
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.setFont(self.font)
    for k, v in pairs(self.words) do
        love.graphics.print(v, self.x, self.y, self.r + math.pi*2/self.number*k, 1, 1, self.ox[k], self.distance, 0, 0)
    end
end

return paradox_state