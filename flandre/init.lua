_class = require 'flandre.middleclass'
local flandre = {
    _VERSION = 'Flandre v1.0.0',
    _LOGO = [[
    ________)                    
    (, /     /)          /)       
      /___, // _  __   _(/ __   _ 
   ) /     (/_(_(_/ (_(_(_/ (__(/_
  (_/                             
    ]],
    _LICENSE = [[
    MIT License

    Copyright (c) 2023 meohyphenw
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    ]]
}

flandre.flanstart = function() print(flandre._LOGO) print(flandre._VERSION) end

flandre.task = require("flandre.task")
_task = flandre.task

flandre.core = require('flandre.core')
_core = flandre.core
_objp = flandre.core.object
_image = flandre.core.image
_quad = flandre.core.quad
_quad_group = flandre.core.quad_group
_font = flandre.core.font
_sound = flandre.core.sound
_music = flandre.core.music
_pn = flandre.core.objlen
_new = flandre.core.new
_newex = flandre.core.newex
_rmv = flandre.core.rmv
_load_image = flandre.core.load_image
_unload_image = flandre.core.unload_image
_load_quad = flandre.core.load_quad
_unload_quad = flandre.core.unload_quad
_load_quad_group_x = flandre.core.load_quad_group_x
_load_quad_group_y = flandre.core.load_quad_group_y
_load_quad_group_batch = flandre.core.load_quad_group_batch
_unload_quad_group = flandre.core.unload_quad_group
_load_font = flandre.core.load_font
_unload_font = flandre.core.unload_font
_load_sound = flandre.core.load_sound
_unload_sound = flandre.core.unload_sound
_load_music = flandre.core.load_music
_unload_music = flandre.core.unload_music

flandre.screen = require('flandre.screen')
_scn = flandre.screen
_scn_rw = flandre.screen.ratio_width
_scn_rh = flandre.screen.ratio_height

flandre.object = require('flandre.object')
_class_object = flandre.object

flandre.sprite = require('flandre.sprite')
_class_sprite = flandre.sprite

flandre.interface = require('flandre.interface')
_class_interface = flandre.interface

flandre.text = require('flandre.text')
_class_text = flandre.text

flandre.flanstart()
return flandre