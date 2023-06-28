local is_down = love.keyboard.isDown
local circle = _class('circle', _class_object)

function circle:initialize()
    _class_object.initialize(self)
    self._content = 0
    self.font = _font.deng ---@type love.Font
    self.distance = 50
    self.r = 0
    self.x = 300
    self.y = 300
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
    self.speed = 0.03
    self.ca = 0.25
end

function circle:update_words()
    if self._content < 10 then
        self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = tostring(self._content), [8] = '%'}
        self.number = 9
    elseif self._content < 100 then
        self.words = {[0] = 'P', [1] = 'A', [2] = 'R', [3] = 'A', [4] = 'D', [5] = 'O', [6] = 'X',[7] = tostring(math.floor(self._content/10)),
            [8] = tostring(self._content%10), [9] = '%'}
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
function circle:set_content(v)
    self._content = v
    self:update_words()
end

function circle:update()
    if is_down('w') and self._content < 100 then
        self:set_content(self._content+1)
    elseif is_down('s') and self._content > 0 then
        self:set_content(self._content-1)
    end
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
            self.speed = 0.02
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
            self.speed = 0.03
            self.is_down = false
        end
    end
end

function circle:draw()
    love.graphics.setColor(1,1,1,self.ca)
    love.graphics.setFont(self.font)
    for k, v in pairs(self.words) do
        love.graphics.print(v, self.x, self.y, self.r + math.pi*2/self.number*k, 1, 1, self.ox[k], self.distance, 0, 0)
    end
end

_new(circle)