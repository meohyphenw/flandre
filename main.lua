flandre = require 'flandre'

function love.load()
    _load_font('unifont.TTF', 'unifont', 30)
    _new(_class_text, [[The quick brown fox jumps over the lazy dog]])
    _last.font = _font.unifont
    _last.agn = 'l'
    _last.fmt = true
    _last.txtagn = 'left'
end

function love.update(dt)
    flandre.core.update(dt)
end

function love.draw()
    flandre.screen.change()
    flandre.core.draw()
end
