sub init()
    rowlist = m.top.findNode("RowListscene")
    rowlist.content = CreateObject("roSGNode", "listContent")
    m.top.setFocus(true)
end sub