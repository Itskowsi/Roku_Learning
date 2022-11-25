sub init()
    m.groupnode = m.top.findNode("groupNode")

    m.playbtnrect=m.top.findNode("playbtnrect")                 'Rectangle
    m.playLabel=m.top.findNode("playLabel")                     'Label
    m.playButton=m.top.findNode("playButton")                   'Button

    m.moreinforect=m.top.findNode("moreinforect")               'Rectangle
    m.moreinfolabel=m.top.findNode("moreinfolabel")             'Label 
    m.moreinfo=m.top.findNode("moreinfo")                       'Button
    m.moreinfo.observefield("buttonSelected", "onButtonSelected")

    m.popup=m.top.findNode("popup")
    m.cancelRect=m.top.findNode("cancelRect")
    m.cancelBtn=m.top.findNode("cancelBtn")

    m.contentLabel=m.top.findNode("contentLabel")

    m.focuskey=0
    updatefocus()
end sub

function onButtonSelected()
    m.popup.visible=true
    m.focuskey=2
    m.cancelBtn.observefield("buttonSelected","cancelButton")
    
end function

function cancelButton()
    m.popup.visible=false
    m.moreinfo.setFocus(true)
end function

function updatefocus()
    if m.focuskey = 0 
        m.focuskey=1                  'set focus to more info button
        m.moreinfo.setFocus(true)
        m.moreinforect.color = "0xEF6C2E"
        m.moreinfolabel.color = "0x000000"
        
        m.cancelBtn.setFocus(false)
        m.playButton.setFocus(false)
        m.playbtnrect.color = "0x000000"
        m.playLabel.color = "0xffffff"
        m.cancelRect.color="0xFFFFFF"

    else if m.focuskey=1
        m.focuskey=0                'set focus to play button
        m.playButton.setFocus(true)
        m.playbtnrect.color = "0xEF6C2E"
        m.playLabel.color = "0x000000"
        
        m.cancelBtn.setFocus(false)
        m.moreinfo.setFocus(false)
        m.moreinforect.color = "0x000000"
        m.moreinfolabel.color = "0xffffff"
        m.cancelRect.color="0xFFFFFF"
    else if m.focuskey=2
        m.focuskey=1
        m.cancelBtn.setFocus(true)
        m.playButton.setFocus(false)
        m.moreinfo.setFocus(false)
        m.cancelRect.color="0xEF6C2E"
    end if
end function

function onKeyEvent(key,press) as boolean
    handle = false
    if press
        if key="right"
            if m.focuskey=0
                updatefocus()
                handle=true
            end if
        else if key="left"
            if m.focuskey=1
                updatefocus()
                handle=true
            end if
        else if key="down"
            if m.focuskey=2
                updatefocus()
                handle=true
            end if
        end if        
    end if
  return handle
end function  