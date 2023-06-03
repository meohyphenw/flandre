_load_image('res/player/reimu/pl00.png', 'pl00')
_load_image('res/player/reimu/pl00b.png', 'pl00b')

_load_quad_group_batch(_image.pl00, "pl00_normal", {
    {0,0,32,48,1}, {32,0,32,48,2}, {64,0,32,48,3}, {96,0,32,48,4},
    {128,0,32,48,5}, {160,0,32,48,6}, {192,0,32,48,7}, {224,0,32,48,8}
})

_load_quad_group_batch(_image.pl00, "pl00_leftex", {
    {0,48,32,48,1}, {32,48,32,48,2}, {64,48,32,48,3}, {96,48,32,48,4}
})

_load_quad_group_batch(_image.pl00, "pl00_rightex", {
    {0,96,32,48,1}, {32,96,32,48,2}, {64,96,32,48,3}, {96,96,32,48,4}
})

_load_quad_group_batch(_image.pl00, "pl00_left", {
    {128,48,32,48,1}, {160,48,32,48,2}, {192,48,32,48,3}, {224,48,32,48,4}
})

_load_quad_group_batch(_image.pl00, "pl00_right", {
    {128,96,32,48,1}, {160,96,32,48,2}, {192,96,32,48,3}, {224,96,32,48,4}
})

_load_quad_group_batch(_image.pl00, "pl00_bullet", {
	{192,144,64,16,1}
})
