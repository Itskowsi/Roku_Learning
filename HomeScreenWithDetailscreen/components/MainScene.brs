sub init()
    m.HomeScreen=m.top.findNode("HomeScreen")
    m.DetailScreen=m.top.findNode("DetailScreen")
    m.HomeScreen.visible=true
    m.HomeScreen.setFocus(true)
end sub

sub ShowDetailScreen()
    m.HomeScreen.visible=false
    m.HomeScreen.setFocus(false)
    m.DetailScreen.visible=true
    m.DetailScreen.setFocus(true)
end sub