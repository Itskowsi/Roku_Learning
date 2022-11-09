sub init()
    m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"

    m.layoutgrp = m.top.findNode("layoutgrp")
    m.Button = m.top.findNode("Button")
    m.Button.observefield("buttonSelected","onButtonSelected")
    m.top.setFocus(true)

end sub

sub onButtonSelected()
    if m.layoutgrp.visible = true
        m.layoutgrp.visible = false
        m.Button.text="Show Image"
    elseif m.layoutgrp.visible = false
        m.layoutgrp.visible = true
        m.Button.text="Hide Image"
    end if
end sub
