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
	auto_width = get_window_size(true)/ORIGIN_WIDTH,
	auto_height = get_window_size(false)/ORIGIN_HEIGHT
}

local ratio_width = ratio.AUTO_WIDTH
local ratio_height = ratio.AUTO_HEIGHT

---@return number
function screen.origin_width()
	return ORIGIN_WIDTH
end

---@return number
function screen.origin_height()
	return ORIGIN_HEIGHT
end

function screen.ratio_width()
	return ratio_width
end

function screen.ratio_height()
	return ratio_height
end

---更改缩放
function screen.change()
    love.graphics.scale(ratio_width, ratio_height)
end

---更新自动比例
function screen.update(m)
	ratio.auto_width = get_window_size(true)/ORIGIN_WIDTH
	ratio.auto_height = get_window_size(false)/ORIGIN_HEIGHT
	if m == 'auto' then
		ratio_width = ratio.auto_width
		ratio_height = ratio.auto_height
	elseif m == '1024x576' then
		ratio_width = ratio._1024x576_WIDTH
		ratio_height = ratio._1024x576_HEIGHT
	elseif m == '1280x720' then
		ratio_width = ratio._1280x720_WIDTH
		ratio_height = ratio._1280x720_HEIGHT
	elseif m == '1366x768' then
		ratio_width = ratio._1366x768_WIDTH
		ratio_height = ratio._1366x768_HEIGHT
	elseif m == '1600x900' then
		ratio_width = ratio._1600x900_WIDTH
		ratio_height = ratio._1600x900_HEIGHT
	elseif m == '1920x1080' then
		ratio_width = ratio._1920x1080_WIDTH
		ratio_height = ratio._1920x1080_HEIGHT
	elseif m == '2560x1440' then
		ratio_width = ratio._2560x1440_WIDTH
		ratio_height = ratio._1024x576_HEIGHT
	end
end

return screen