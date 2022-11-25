sub init()
    m.playBtn=m.top.findNode("playBtn")
    m.player=m.top.findNode("player")
    m.buttonGroup=m.top.findNode("buttonGroup")
    m.playBtn.observefield("buttonSelected","playVideo")
    m.top.setFocus(true)
end sub

function playVideo()
    videoContent = CreateObject("RoSGNode","ContentNode")
    videoContent.title="Sample Video Player"
    videoContent.url="https://roku-webdev-opus.s3.amazonaws.com/public-videos/big+stream+trimmed.mp4"
    videoContent.streamFormat="auto"

    m.player.content=videoContent
    m.player.control="play"
    m.player.visible=true
    m.buttonGroup.visible=false
end function

function onKeyEvent(key,press) as boolean
    handle=false
    if press
        if key="back"
            if m.player.visible=true
                m.player.control="stop"
                m.player.visible=false
                m.player.setFocus(false)
                m.buttonGroup.visible=true
                m.playBtn.setFocus(true)
                handle=true
            end if
        end if
    end if
    return handle
end function