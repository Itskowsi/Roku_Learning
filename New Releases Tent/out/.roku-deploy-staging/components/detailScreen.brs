sub init()
    m.director=m.top.findNode("director")
    m.starring=m.top.findNode("starring")
    m.Genres=m.top.findNode("Genres")
    m.bannerPoster=m.top.findNode("bannerPoster")
    m.movieTitle=m.top.findNode("movieTitle")
    m.movieSubTitle=m.top.findNode("movieSubTitle")
    m.movieDetail=m.top.findNode("movieDetail")
    m.whiteRect=m.top.findNode("whiteRect")
    m.blackRect=m.top.findNode("blackRect")

    m.top.observefield("visible","onVisible")
end sub 

function onVisible()
    m.focusKey=0
    updateFocuse()
end function

function detailApi()
    m.top.parseApi=false

    itemType = m.top.contentData.itemType.ToStr()
	if itemType = "0"
		itemType = "1"
	end if
    print "--------------------------------------------->>>>>itemType"itemType
    contentId = m.top.contentData.contentId.ToStr()
    print "--------------------------------------------->>>>>contentId"contentId

    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    ' m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v1/getItemDetails/1/2052/MTI2MzEzfGZkNTdmODM4M2VjYTNkMDl8QW5kcm9pZCBTREsgYnVpbHQgZm9yIHg4Ng=="
    ' m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v1/getItemDetails/1/2045/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NzAzMDc0NTEsImV4cCI6MTY3MDM5Mzg1MX0.oUKH9mCX0C7YhXC4C8cbsIGxr-Q-aXK_RoFPNV68jys"
    m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v1/getItemDetails/"+itemType+"/"+contentId+"/MTI2MzEzfGZkNTdmODM4M2VjYTNkMDl8QW5kcm9pZCBTREsgYnVpbHQgZm9yIHg4Ng=="
    m.readContentTask.control ="RUN"
end function

function loadJson()
    json = m.readContentTask.content
    item=json.response.itemDetails
    m.bannerPoster.uri=item.profileImage
    m.movieTitle.text=item.title
    m.movieSubTitle.text=str(item.releaseYear)+" | "+ item.duration +" | "+item.censorCertificate
    m.movieDetail.text=item.description  

    m.director.drawingStyles={
        "directorwhite":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#FFFFFF"
        }
        "directorcolor":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#EF6C2E"
        }
    }
    m.starring.drawingStyles={
        "starringwhite":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#FFFFFF"
        }
        "starringcolor":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#EF6C2E"
        }
    }
    m.Genres.drawingStyles={
        "Genreswhite":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#FFFFFF"
        }
        "Genrescolor":{
            "fontSize":13
            "fontUri":"pkg://fonts/Open_Sans/OpenSans-Regular.ttf"
            "color":"#EF6C2E"
        }
    }
    director=""
    for each crew in item.crew
        director = director+" "+crew.title
    end for
    starring=""
    for each cast in item.cast
        starring = starring+" "+cast.title        
    end for
    genres=""
    for each genre in item.genre
       genres = genres+" "+genre.title
    end for
    m.director.text="<directorwhite>Director </directorwhite><directorcolor>" +director+"</directorcolor>"
    m.starring.text="<starringwhite>Starring </starringwhite><starringcolor>"+starring+"</starringcolor>"
    m.Genres.text="<Genreswhite>Genres </Genreswhite><Genrescolor>"+starring+"</Genrescolor>"
end function

function updateFocuse()
    if m.focusKey=0
        m.whiteRect.translation="[40,468]"
    else if m.focusKey=1
        m.whiteRect.translation="[40,518]"
    else if m.focusKey=2
        m.whiteRect.translation="[40,568]"
    end if
end function

function onKeyEvent(key,press) as boolean
    handle=false
    if press
        if key="down"
            if m.focusKey=0
                m.focusKey=1
                updateFocuse()
            else if m.focusKey=1
                m.focusKey=2
                updateFocuse()
            end if
        else if key="up"
            if m.focusKey=2
                m.focusKey=1
                updateFocuse()
            else if m.focusKey=1
                m.focusKey=0
                updateFocuse()
            end if
        end if
    end if
    return handle
end function