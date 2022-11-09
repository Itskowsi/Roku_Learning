sub init()
    m.group = m.top.findNode("group")
    m.groupbutton = m.top.findNode("groupButton")
    m.groupbutton.buttons = ["Hide Image","Show Image"]
    m.groupbutton.observefield("buttonSelected","onButtonSelected")
    m.top.setFocus(true)
end sub

function onButtonSelected()
    if m.groupbutton.buttonSelected = 0
        m.group.visible = false
    elseif m.groupbutton.buttonSelected = 1
        m.group.visible = true
    endif
end function