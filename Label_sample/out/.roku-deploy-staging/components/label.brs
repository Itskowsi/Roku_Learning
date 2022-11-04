sub init()
    m.top.backgroundURI = "pkg:/images/purplebg.jpg"
    m.top.setFocus(true)
    m.label1 = m.top.findNode("label1")
    m.label2 = m.top.findNode("label2")
    m.label3 = m.top.findNode("label3")
    m.label4 = m.top.findNode("label4")
    m.label5 = m.top.findNode("label5")

    m.label1.color="0x56fffe"
    m.label2.color="0xff1c58"
    m.label3.color="0xffffff"
    m.label4.color="0x000000"
    m.label5.color="0x0d709c"
end sub