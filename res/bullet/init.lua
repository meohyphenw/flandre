_load_image('res/bullet/bullet1.png', 'bullet_map1')
_load_image('etbreak.png', 'etbreak')
_load_quad_group_batch(_image.bullet_map1, 'bullet_map1', {
    {224,0,16,16,'scale_black'}, {224,16,16,16,'scale_deep_red'}, {224,32,16,16,'scale_red'},
    {224,48,16,16,'scale_purple'}, {224,64,16,16,'scale_pink'}, {224,80,16,16,'scale_deep_blue'},
    {224,96,16,16,'scale_blue'}, {224,112,16,16,'scale_deep_cyan'}, {224,128,16,16,'scale_cyan'},
    {224,144,16,16,'scale_deep_green'}, {224,160,16,16,'scale_green'}, {224,176,16,16,'scale_greenish_yellow'},
    {224,192,16,16,'scale_deep_yellow'}, {224,208,16,16,'scale_yellow'}, {224,224,16,16,'scale_golden'},
    {224,240,16,16,'scale_white'},

    {208,0,16,16,'ring_black'}, {208,16,16,16,'ring_deep_red'}, {208,32,16,16,'ring_red'},
    {208,48,16,16,'ring_purple'}, {208,64,16,16,'ring_pink'}, {208,80,16,16,'ring_deep_blue'},
    {208,96,16,16,'ring_blue'}, {208,112,16,16,'ring_deep_cyan'}, {208,128,16,16,'ring_cyan'},
    {208,144,16,16,'ring_deep_green'}, {208,160,16,16,'ring_green'}, {208,176,16,16,'ring_greenish_yellow'},
    {208,192,16,16,'ring_deep_yellow'}, {208,208,16,16,'ring_yellow'}, {208,224,16,16,'ring_golden'},
    {208,240,16,16,'ring_white'},

    {192,0,16,16,'circle_black'}, {192,16,16,16,'circle_deep_red'}, {192,32,16,16,'circle_red'},
    {192,48,16,16,'circle_purple'}, {192,64,16,16,'circle_pink'}, {192,80,16,16,'circle_deep_blue'},
    {192,96,16,16,'circle_blue'}, {192,112,16,16,'circle_deep_cyan'}, {192,128,16,16,'circle_cyan'},
    {192,144,16,16,'circle_deep_green'}, {192,160,16,16,'circle_green'}, {192,176,16,16,'circle_greenish_yellow'},
    {192,192,16,16,'circle_deep_yellow'}, {192,208,16,16,'circle_yellow'}, {192,224,16,16,'circle_golden'},
    {192,240,16,16,'circle_white'},

    {176,0,16,16,'rice_black'}, {176,16,16,16,'rice_deep_red'}, {176,32,16,16,'rice_red'},
    {176,48,16,16,'rice_purple'}, {176,64,16,16,'rice_pink'}, {176,80,16,16,'rice_deep_blue'},
    {176,96,16,16,'rice_blue'}, {176,112,16,16,'rice_deep_cyan'}, {176,128,16,16,'rice_cyan'},
    {176,144,16,16,'rice_deep_green'}, {176,160,16,16,'rice_green'}, {176,176,16,16,'rice_greenish_yellow'},
    {176,192,16,16,'rice_deep_yellow'}, {176,208,16,16,'rice_yellow'}, {176,224,16,16,'rice_golden'},
    {176,240,16,16,'rice_white'},

    {160,0,16,16,'sharp_black'}, {160,16,16,16,'sharp_deep_red'}, {160,32,16,16,'sharp_red'},
    {160,48,16,16,'sharp_purple'}, {160,64,16,16,'sharp_pink'}, {160,80,16,16,'sharp_deep_blue'},
    {160,96,16,16,'sharp_blue'}, {160,112,16,16,'sharp_deep_cyan'}, {160,128,16,16,'sharp_cyan'},
    {160,144,16,16,'sharp_deep_green'}, {160,160,16,16,'sharp_green'}, {160,176,16,16,'sharp_greenish_yellow'},
    {160,192,16,16,'sharp_deep_yellow'}, {160,208,16,16,'sharp_yellow'}, {160,224,16,16,'sharp_golden'},
    {160,240,16,16,'sharp_white'},

    {144,0,16,16,'prism_black'}, {144,16,16,16,'prism_deep_red'}, {144,32,16,16,'prism_red'},
    {144,48,16,16,'prism_purple'}, {144,64,16,16,'prism_pink'}, {144,80,16,16,'prism_deep_blue'},
    {144,96,16,16,'prism_blue'}, {144,112,16,16,'prism_deep_cyan'}, {144,128,16,16,'prism_cyan'},
    {144,144,16,16,'prism_deep_green'}, {144,160,16,16,'prism_green'}, {144,176,16,16,'prism_greenish_yellow'},
    {144,192,16,16,'prism_deep_yellow'}, {144,208,16,16,'prism_yellow'}, {144,224,16,16,'prism_golden'},
    {144,240,16,16,'prism_white'},

    {128,0,16,16,'square_black'}, {128,16,16,16,'square_deep_red'}, {128,32,16,16,'square_red'},
    {128,48,16,16,'square_purple'}, {128,64,16,16,'square_pink'}, {128,80,16,16,'square_deep_blue'},
    {128,96,16,16,'square_blue'}, {128,112,16,16,'square_deep_cyan'}, {128,128,16,16,'square_cyan'},
    {128,144,16,16,'square_deep_green'}, {128,160,16,16,'square_green'}, {128,176,16,16,'square_greenish_yellow'},
    {128,192,16,16,'square_deep_yellow'}, {128,208,16,16,'square_yellow'}, {128,224,16,16,'square_golden'},
    {128,240,16,16,'square_white'},

    {112,0,16,16,'ammo_black'}, {112,16,16,16,'ammo_deep_red'}, {112,32,16,16,'ammo_red'},
    {112,48,16,16,'ammo_purple'}, {112,64,16,16,'ammo_pink'}, {112,80,16,16,'ammo_deep_blue'},
    {112,96,16,16,'ammo_blue'}, {112,112,16,16,'ammo_deep_cyan'}, {112,128,16,16,'ammo_cyan'},
    {112,144,16,16,'ammo_deep_green'}, {112,160,16,16,'ammo_green'}, {112,176,16,16,'ammo_greenish_yellow'},
    {112,192,16,16,'ammo_deep_yellow'}, {112,208,16,16,'ammo_yellow'}, {112,224,16,16,'ammo_golden'},
    {112,240,16,16,'ammo_white'},

    {96,0,16,16,'long_bacteria_black'}, {96,16,16,16,'long_bacteria_deep_red'}, {96,32,16,16,'long_bacteria_red'},
    {96,48,16,16,'long_bacteria_purple'}, {96,64,16,16,'long_bacteria_pink'}, {96,80,16,16,'long_bacteria_deep_blue'},
    {96,96,16,16,'long_bacteria_blue'}, {96,112,16,16,'long_bacteria_deep_cyan'}, {96,128,16,16,'long_bacteria_cyan'},
    {96,144,16,16,'long_bacteria_deep_green'}, {96,160,16,16,'long_bacteria_green'}, {96,176,16,16,'long_bacteria_greenish_yellow'},
    {96,192,16,16,'long_bacteria_deep_yellow'}, {96,208,16,16,'long_bacteria_yellow'}, {96,224,16,16,'long_bacteria_golden'},
    {96,240,16,16,'long_bacteria_white'},

    {80,0,16,16,'star_black'}, {80,16,16,16,'star_deep_red'}, {80,32,16,16,'star_red'},
    {80,48,16,16,'star_purple'}, {80,64,16,16,'star_pink'}, {80,80,16,16,'star_deep_blue'},
    {80,96,16,16,'star_blue'}, {80,112,16,16,'star_deep_cyan'}, {80,128,16,16,'star_cyan'},
    {80,144,16,16,'star_deep_green'}, {80,160,16,16,'star_green'}, {80,176,16,16,'star_greenish_yellow'},
    {80,192,16,16,'star_deep_yellow'}, {80,208,16,16,'star_yellow'}, {80,224,16,16,'star_golden'},
    {80,240,16,16,'star_white'},

    {64,0,16,16,'ghost_black'}, {64,16,16,16,'ghost_deep_red'}, {64,32,16,16,'ghost_red'},
    {64,48,16,16,'ghost_purple'}, {64,64,16,16,'ghost_pink'}, {64,80,16,16,'ghost_deep_blue'},
    {64,96,16,16,'ghost_blue'}, {64,112,16,16,'ghost_deep_cyan'}, {64,128,16,16,'ghost_cyan'},
    {64,144,16,16,'ghost_deep_green'}, {64,160,16,16,'ghost_green'}, {64,176,16,16,'ghost_greenish_yellow'},
    {64,192,16,16,'ghost_deep_yellow'}, {64,208,16,16,'ghost_yellow'}, {64,224,16,16,'ghost_golden'},
    {64,240,16,16,'ghost_white'},

    {56,0,8,8,'bacteria_black'}, {56,8,8,8,'bacteria_deep_red'}, {56,16,8,8,'bacteria_red'},
    {56,24,8,8,'bacteria_purple'}, {56,32,8,8,'bacteria_pink'}, {56,40,8,8,'bacteria_deep_blue'},

    {17,0,30,32,'fog_black'}, {17,32,30,32,'fog_red'}, {17,64,30,32,'fog_pink'}, {17,96,30,32,'fog_blue'},
    {17,128,30,32,'fog_cyan'}, {17,160,30,32,'fog_green'}, {17,192,30,32,'fog_yellow'}, {17,224,30,32,'fog_white'}
})

_load_quad_group_batch(_image.bullet_map1, 'bulletfog', {
    {0,0,64,64,1}, {64,0,64,64,2}, {128,0,64,64,3}, {192,0,64,64,4},
    {0,64,64,64,5}, {64,64,64,64,6}, {128,64,64,64,7}, {192,64,64,64,8}
})

_load_quad_group_batch(_image.etbreak, 'etbreak', {
    {0,0,64,64,1}, {64,0,64,64,2}, {128,0,64,64,3}, {192,0,64,64,4},
    {0,64,64,64,5}, {64,64,64,64,6}, {128,64,64,64,7}, {192,64,64,64,8}
})
