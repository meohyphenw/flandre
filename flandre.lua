_class = require 'middleclass'
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

--全局变量均为 “下划线+原变量名（可能简写）” 形式，如果当作库来使用可以删去

flandre.task = require("task")
_task = flandre.task

flandre.pool = require('pool')
_p = flandre.pool
_objp = flandre.pool.object
_pn = flandre.pool.objlen
_new = flandre.pool.new
_newex = flandre.pool.newex
_rmv = flandre.pool.rmv
_load_image = flandre.pool.load_image
_unload_image = flandre.pool.unload_image
_load_quad = flandre.pool.load_quad
_unload_quad = flandre.pool.unload_quad
_load_quad_group_x = flandre.pool.load_quad_group_x
_load_quad_group_y = flandre.pool.load_quad_group_y
_load_quad_group_batch = flandre.pool.load_quad_group_batch


flandre.object = require('object')
_class_object = flandre.object

flandre.sprite = require('sprite')
_class_sprite = flandre.sprite

flandre.flanstart()
return flandre