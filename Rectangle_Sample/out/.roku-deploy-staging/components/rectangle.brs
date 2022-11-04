function init()
    m.top.backgroundURI = "pkg:/images/purplebg.jpg"
    m.top.setFocus(true)
    m.myrect1 = m.top.findNode("Rect1")
    m.myrect2 = m.top.findNode("Rect2")
    m.myrect3 = m.top.findNode("Rect3")
    m.myrect4 = m.top.findNode("Rect4")
    m.myrect5 = m.top.findNode("Rect5")
    
    changecolor()
    changewidth()
end function

sub changecolor()
    m.myrect1.color="0x56fffe"
    m.myrect2.color="0xff1c58"
    m.myrect3.color="0xffffff"
    m.myrect4.color="0x000000"
    m.myrect5.color="0x0d709c"
end sub

sub changewidth()
    m.myrect1.width="1000"
    m.myrect2.width="800"
    m.myrect3.width="600"
    m.myrect4.width="400"
    m.myrect5.width="200"
end sub