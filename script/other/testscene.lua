--_new(_class_player, _image.pl00, _quad_group.pl00_normal, _quad_group.pl00_left, _quad_group.pl00_right, _quad_group.pl00_leftex, _quad_group.pl00_rightex, 3, 10,5)
--_new(_do_script('res.player.paradox_state'), {x = 100, y = 100})

local is_down = love.keyboard.isDown

local test_player = _class('test_player', _class_drawable)
function test_player:initialize()
    _class_drawable.initialize(self, _image.pl00b)
    self.is_shoot = false
    self.is_slow = false
    self.is_bomb = false
    self.is_paradox = false
end

function test_player:before()
    _task.new(self, function ()
        while not is_down('q') do
            coroutine.yield()
        end
        _replay.reset()
        _replay.set_mode('r')
    end)
    _task.new(self, function ()
        while true do
            if is_down('z') then
                self.is_shoot = true
                while is_down('z') do
                    coroutine.yield()
                end
                self.is_shoot = false
            end
            coroutine.yield()
        end
    end)
    _task.new(self, function ()
        while true do
            if is_down('x') then
                self.is_bomb = true
                while is_down('x') do
                    coroutine.yield()
                end
                self.is_bomb = false
            end
            coroutine.yield()
        end
    end)
    _task.new(self, function ()
        while true do
            if is_down('c') then
                self.is_paradox = true
                while is_down('c') do
                    coroutine.yield()
                end
                self.is_paradox = false
            end
            coroutine.yield()
        end
    end)
    _task.new(self, function ()
        while true do
            if is_down('lshift') then
                self.is_slow = true
                while is_down('lshift') do
                    coroutine.yield()
                end
                self.is_slow = false
            end
            coroutine.yield()
        end
    end)
end

function test_player:update()
    _task.continue(self)
    if is_down('left') then
        self.x = self.x - 5
    end
    if is_down('right') then
        self.x = self.x + 5
    end
    if is_down('up') then
        self.y = self.y - 5
    end
    if is_down('down') then
        self.y = self.y + 5
    end
    --print('frame state: ', self.x, self.y, self.is_shoot, self.is_slow, self.is_bomb, self.is_paradox)
end

_replay.set_mode('w')
_replay.mark(_newex(test_player))