sub init()
    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v6/tkapi/generateToken"
    m.readContentTask.control ="RUN"
    m.HomeScreen=m.top.findNode("HomeScreen")
    m.RowListScene=m.top.findNode("RowListscene")
    m.DetailScreen=m.top.findNode("DetailScreen")
    
end sub

function loadJson()
    json = m.readContentTask.content
    if json.responseCode = "200"
        m.global.accessToken=json.response
        print "-------------------------------------->>>>json.response"json.response
        m.HomeScreen.parseApi=true
        m.HomeScreen.visible=true
        m.HomeScreen.setFocus(true)
        m.DetailScreen.visible=false
        m.DetailScreen.setFocus(false)
    end if
end function

sub ShowDetailScreen()
    print "After selected.................................................."
    m.HomeScreen.visible=false
    m.HomeScreen.setFocus(false)
    m.DetailScreen.contentData = m.HomeScreen.contentData
    m.DetailScreen.visible=true
    m.DetailScreen.setFocus(true)
    m.DetailScreen.parseApi=true
end sub

function onKeyEvent(key,press) as boolean
    handle = false
    if press
        print "press-------------------------------------->"press
        if key="back"
        print "key-------------------------------------->"key
            m.HomeScreen.parseApi=true
            m.HomeScreen.visible=true
            m.HomeScreen.setFocus(true)
            m.DetailScreen.visible=false
            m.DetailScreen.setFocus(false)
            m.RowListScene.setFocus(true)
            m.top.ShowDetailScreen = false
            handle=true
        end if
    end if
    return handle
end function