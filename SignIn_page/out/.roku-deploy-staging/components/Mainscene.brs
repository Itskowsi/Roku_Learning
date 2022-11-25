sub init()
    
    m.top.backgroundURI="pkg:/images/image.jpg"
    m.SignInPage = m.top.findNode("SignInPage")
    m.SignUpPage = m.top.findNode("SignUpPage")
    m.homePage   = m.top.findNode("HomePage")

    ' m.SignInPage.visible=true
    ' m.SignInPage.setFocus(true)

    m.homePage.visible=true
    m.homePage.setFocus(true)
end sub
function showsignupscreen()
        m.signInPage.showSignUpPage=false
        m.SignInPage.visible=false
        m.SignInPage.setFocus(false)
        m.SignUpPage.focuskey=0
        m.SignUpPage.visible=true
        m.SignUpPage.setFocus(true)
        m.homePage.visible=false
        m.homePage.setFocus(false)  
end function

function showsigninscreen()
    m.SignUpPage.showSignInPage=false
    m.SignUpPage.visible=false
    m.SignUpPage.setFocus(false)
    m.SignInPage.focuskey=0
    m.SignInPage.visible=true
    m.SignInPage.setFocus(true)  
    m.homePage.visible=false
    m.homePage.setFocus(false)  
end function

function showhomescreen() 
    m.SignUpPage.showSignInPage=false
    m.SignUpPage.visible=false
    m.SignUpPage.setFocus(false)
    m.SignInPage.visible=false
    m.SignInPage.setFocus(false) 
    m.homePage.visible=true
    m.homePage.setFocus(true)
end function

function onKeyEvent(key,press) as boolean
    handle=false
    if press
        if key="back"
            if m.SignUpPage.visible=true
                m.SignUpPage.visible=false
                m.SignUpPage.setFocus(false)
                m.SignInPage.visible=true
                m.SignInPage.setFocus(true)
                handle=true
            end if
        end if
    end if
    return handle
end function