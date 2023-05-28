local screen = {}

--- 屏幕坐标横向的最大值，可以作为图片素材的基准大小（如果屏幕大小与其不一样则会按比例缩放，对象原坐标不变）
local ORIGIN_WIDTH = 1024
--- 屏幕坐标纵向的最大值，可以作为图片素材的基准大小（如果屏幕大小与其不一样则会按比例缩放，对象原坐标不变）
local ORIGIN_HEIGHT = 576

---返回窗口大小
---@param m boolean
---@return number
local function get_window_size(m)
	if m then
		r, _, _ =  love.window.getMode()
		return r
	else
		_, r, _ = love.window.getMode()
		return r
	end
end

local ratio = {
	_1024x576_WIDTH = 1024/ORIGIN_WIDTH,
	_1024x576_HEIGHT = 576/ORIGIN_HEIGHT,
	_1280x720_WIDTH = 1280/ORIGIN_WIDTH,
	_1280x720_HEIGHT = 720/ORIGIN_HEIGHT,
	_1366x768_WIDTH = 1366/ORIGIN_WIDTH,
	_1366x768_HEIGHT = 768/ORIGIN_HEIGHT,
	_1600x900_WIDTH = 1600/ORIGIN_WIDTH,
	_1600x900_HEIGHT = 900/ORIGIN_HEIGHT,
	_1920x1080_WIDTH = 1920/ORIGIN_WIDTH,
	_1920x1080_HEIGHT = 1080/ORIGIN_HEIGHT,
	_2560x1440_WIDTH = 2560/ORIGIN_WIDTH,
	_2560x1440_HEIGHT = 1440/ORIGIN_HEIGHT,
	AUTO_WIDTH = get_window_size(true)/ORIGIN_WIDTH,
	AUTO_HEIGHT = get_window_size(false)/ORIGIN_HEIGHT
	--自适应
}

local ratio_width = ratio.AUTO_WIDTH
local ratio_height = ratio.AUTO_HEIGHT

function screen.change()
    love.graphics.scale(ratio_width, ratio_height)
end

return screen