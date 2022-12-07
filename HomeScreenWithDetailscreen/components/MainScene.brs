sub init()
    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v6/tkapi/generateToken"
    m.readContentTask.control ="RUN"
    m.HomeScreen=m.top.findNode("HomeScreen")
    m.RowListScene=m.top.findNode("RowListscene")
    m.DetailScreen=m.top.findNode("DetailScreen")
    m.HomeScreen.parseApi=true
    m.HomeScreen.visible=true
    m.HomeScreen.setFocus(true)
    m.DetailScreen.visible=false
    m.DetailScreen.setFocus(false)
    
end sub

function loadJson()
    json = m.readContentTask.content
    print "--------------------------------->>>>MainScene json"json
    if json.responseCode = "200"
        m.HomeScreen.parseApi=true
        m.HomeScreen.visible=true
        m.HomeScreen.setFocus(true)
        m.DetailScreen.visible=false
        m.DetailScreen.setFocus(false)
    end if
end function

sub ShowDetailScreen()
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
        if key="back"
            m.HomeScreen.parseApi=true
            m.RowListScene.setFocus(true)
            m.HomeScreen.visible=true
            m.HomeScreen.setFocus(true)
            m.DetailScreen.visible=false
            m.DetailScreen.setFocus(false)
            handle=true
        end if
    end if
    return handle
end function