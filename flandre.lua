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
    MIT LICENSE
    Copyright (c) 2023 meo-w
    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the “Software”),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
    OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
    OTHER DEALINGS IN THE SOFTWARE.
    ]]
}

flandre._flanstart = function() print(flandre._LOGO) print(flandre._VERSION) end

flandre.pool = require('pool')
_p = flandre.pool
_objp = flandre.pool.object
_pn = flandre.pool.objlen
_new = flandre.pool.new
_newgt = flandre.pool.newgt
_rmv = flandre.pool.rmv

flandre.object = require('object')
_class_object = flandre.object

flandre.sprite = require('sprite')
_class_sprite = flandre.sprite

flandre._flanstart()
return flandre