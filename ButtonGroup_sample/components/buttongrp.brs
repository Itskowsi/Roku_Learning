sub init()
    m.top.backgroundURI = "pkg:/images/purplebg.jpg"
    m.groupButton = m.top.findNode("groupButton")
    m.rectangle = m.top.findNode("rectangle")
    m.groupButton.buttons = ["OK","Cancel"]
    m.groupButton.observefield("buttonSelected","onButtonSelected")
    m.top.setFocus(true)
end sub

function onButtonSelected()
    if m.groupButton.buttonSelected = 0
        m.rectangle.color = "0xFF0000"
    elseif m.groupButton.buttonSelected = 1
        m.rectangle.color = "0xffffff"
    end if
end function