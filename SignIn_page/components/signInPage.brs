sub init()
    m.SignInGrp=m.top.findNode("SignInGrp")  
    
    m.whiteRect=m.top.findNode("whiteRect")
    m.blackRect=m.top.findNode("blackRect")
    
    m.username  = m.top.findNode("SIusername")
    m.password  = m.top.findNode("SIpassword")
    m.signInBtnRect=m.top.findNode("signInBtnRect")
    m.signInBtn = m.top.findNode("signInBtn")           'Sign In Button
    m.signupPgLabel=m.top.findNode("signupPgLabel")
    m.signupPgBtn=m.top.findNode("signupPgBtn")
    m.passwordBtn=m.top.findNode("passwordeBtn")
    m.usernameBtn=m.top.findNode("usernameBtn")

    m.signInBtn.observefield("buttonselected","showHomePage")
    m.signupPgBtn.observefield("buttonselected","showSignUpPage")
    m.top.observefield("visible","onVisible")
    
    m.keyboardGrp=m.top.findNode("keyboardGrp")
end sub

function onVisible()
    print "On visible"
    m.focuskey=0
    updatefocus()
    m.SignInGrp.visible=true
end function

function showHomePage()
    print "Show Home Page"
    m.top.showHomePage=true
end function

function showSignUpPage()
    print "Show Sign up"
    m.top.showSignUpPage = true
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
        m.password.active=false
        m.signInBtn.setFocus(false)
        m.usernameBtn.setFocus(true)
        m.passwordBtn.setFocus(false)
        m.signupPgBtn.setFocus(false)
        nullWhiteRect()
    else if m.focuskey=1
        m.username.active=false
        m.password.active=true
        m.usernameBtn.setFocus(false)
        m.passwordBtn.setFocus(true)
        m.signInBtn.setFocus(false)
        m.signupPgBtn.setFocus(false)
        nullWhiteRect()
    else if m.focuskey=2
        m.username.active=false
        m.password.active=false
        m.usernameBtn.setFocus(false)
        m.passwordBtn.setFocus(false)
        m.signInBtn.setFocus(true)
        m.signupPgBtn.setFocus(false)
        m.whiteRect.height=50
        m.blackRect.height=46
        m.whiteRect.width=150
        m.blackRect.width=146
        m.whiteRect.translation="[65,265]"
    else if m.focuskey=3
        m.username.active=false
        m.password.active=false
        m.signInBtn.setFocus(false)
        m.signupPgBtn.setFocus(true)
        m.whiteRect.height=20
        m.blackRect.height=16
        m.whiteRect.width=55
        m.blackRect.width=51
        m.whiteRect.translation="[120,341]"
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
            end if
        else if key="up"
            if m.focuskey=3
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
