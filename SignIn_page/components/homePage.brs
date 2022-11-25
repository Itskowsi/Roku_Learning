sub init()
    m.groupnode = m.top.findNode("groupNode")

    m.whiteRect=m.top.findNode("whiteRect")
    m.blackRect=m.top.findNode("blackRect")

    m.playButton=m.top.findNode("playButton")                   
    m.moreinfo=m.top.findNode("moreinfo")                       
    m.moreinfo.observefield("buttonSelected", "onButtonSelected")

    m.popup=m.top.findNode("popup")
    m.cancelBtn=m.top.findNode("cancelBtn")

    m.contentLabel=m.top.findNode("contentLabel")

    m.focuskey=0
    updatefocus()
end sub

function onButtonSelected()
    m.popup.visible=true
    m.cancelBtn.observefield("buttonSelected","cancelButton")
    m.cancelBtn.setFocus(true)    
end function

function cancelButton()
    m.popup.visible=false
    m.moreinfo.setFocus(true)
end function

function updatefocus()
    if m.focuskey = 0                           'set focus to more info button
        m.moreinfo.setFocus(true)        
        m.cancelBtn.setFocus(false)
        m.playButton.setFocus(false)
        m.whiteRect.height=47
        m.blackRect.height=43
        m.whiteRect.width=179
        m.blackRect.width=175
        m.whiteRect.translation="[246,447]"

    else if m.focuskey=1                          'set focus to play button
        m.playButton.setFocus(true)        
        m.cancelBtn.setFocus(false)
        m.moreinfo.setFocus(false)
        m.whiteRect.height=47
        m.blackRect.height=43
        m.whiteRect.width=179
        m.blackRect.width=175
        m.whiteRect.translation="[46,447]"
    end if
end function

function onKeyEvent(key,press) as boolean
    handle = false
    if press
        if key="left"
            if m.focuskey=0
                m.focuskey=1
                updatefocus()
                handle=true
            end if
        else if key="right"
            if m.focuskey=1
                m.focuskey =0 
                updatefocus()
                handle=true
            end if
        end if        
    end if
  return handle
end function  