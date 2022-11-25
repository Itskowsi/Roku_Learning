sub init()

    m.whiteRect=m.top.findNode("whiteRect")
    m.blackRect=m.top.findNode("blackRect")

    m.SignUpGrp=m.top.findNode("SignUpGrp")
    m.username=m.top.findNode("username")
    m.usernameBtn=m.top.findNode("usernameBtn")
    m.newpassword=m.top.findNode("newpassword")
    m.passwordBtn=m.top.findNode("passwordBtn")
    m.confirmpassword=m.top.findNode("confirmpassword")
    m.confirmpwdBtn=m.top.findNode("confirmpwdBtn")
    m.signUpBtnRect=m.top.findNode("signUpBtnRect")
    m.signinPgLabel=m.top.findNode("signinPgLabel")

    m.signUpBtn=m.top.findNode("signUpBtn") 
    m.signUpBtn.observefield("buttonselected","showHomePage")
                
    m.signinPgBtn=m.top.findNode("signinPgBtn")
    m.signinPgBtn.observefield("buttonselected","showSignInPage")
    m.top.observefield("visible","onVisible")

end sub

function onVisible()
    m.focuskey=0
    updatefocus()
    m.SignUpGrp.visible=true
end function

function showHomePage()
    m.top.showHomepage=true
end function

function showSignInPage()
    m.top.showSignInPage = true
end function

function nullWhiteRect()
    m.whiteRect.height=0
    m.blackRect.height=0
    m.whiteRect.width=0
    m.blackRect.width=0
    m.whiteRect.translation="[0,0]"
end function

function updatefocus()
    if m.focuskey=0
        m.username.active=true
        m.usernameBtn.setFocus(true)
        m.newpassword.active=false
        m.confirmpassword.active=false
        m.signUpBtn.setFocus(false)
        m.signinPgBtn.setFocus(false)
        nullWhiteRect()
    else if m.focuskey=1
        m.username.active=false
        m.newpassword.active=true
        m.passwordBtn.setFocus(true)
        m.confirmpassword.active=false
        m.signUpBtn.setFocus(false)
        m.signinPgBtn.setFocus(false)
    else if m.focuskey=2
        m.username.active=false
        m.newpassword.active=false
        m.confirmpassword.active=true
        m.confirmpwdBtn.setFocus(true)
        m.signUpBtn.setFocus(false)
        m.signinPgBtn.setFocus(false)
        nullWhiteRect()
    else if m.focuskey=3
        m.username.active=false
        m.newpassword.active=false
        m.confirmpassword.active=false
        m.signUpBtn.setFocus(true)
        m.signinPgBtn.setFocus(false)
        m.whiteRect.height=50
        m.blackRect.height=46
        m.whiteRect.width=150
        m.blackRect.width=146
        m.whiteRect.translation="[65,295]"

    else if m.focuskey=4
        m.username.active=false
        m.newpassword.active=false
        m.confirmpassword.active=false
        m.signUpBtn.setFocus(false)
        m.signinPgBtn.setFocus(true)
        m.whiteRect.height=20
        m.blackRect.height=16
        m.whiteRect.width=50
        m.blackRect.width=46
        m.whiteRect.translation="[120,368]"
    end if
end function

function onKeyEvent(key,press) as boolean
    handle=false
    if press
        if key="down"
            if m.focuskey=0
                m.focuskey=1
                updatefocus()
                handle=true
            else if m.focuskey=1
                m.focuskey=2
                updatefocus()
                handle=true
            else if m.focuskey=2
                m.focuskey=3
                updatefocus()
                handle=true
            else if m.focuskey=3
                m.focuskey=4
                updatefocus()
                handle=true
            end if
        else if key="up"
            if m.focuskey=4
                m.focuskey=3
                updatefocus()
                handle=true
            else if m.focuskey=3
                m.focuskey=2
                updatefocus()
                handle=true
            else if m.focuskey=2
                m.focuskey=1
                updatefocus()
                handle=true
            else if m.focuskey=1
                m.focuskey=0
                updatefocus()
                handle=true
            end if
        end if
    end if
    return handle
end function