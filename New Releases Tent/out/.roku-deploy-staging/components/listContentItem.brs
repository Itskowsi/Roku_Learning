sub init()
    m.itemposter = m.top.findNode("itemPoster")
    m.itemmask = m.top.findNode("itemMask")
end sub
sub showcontent()
    itemcontent = m.top.itemContent
    m.itemposter.uri = itemcontent.HDPosterUrl
end sub
sub showfocus()
    scale = 1 + (m.top.focusPercent * 0.08)
    m.itemposter.scale = [scale, scale]
end sub
sub showrowfocus()
    m.itemmask.opacity = 0.75 - (m.top.rowFocusPercent * 0.75)
end sub