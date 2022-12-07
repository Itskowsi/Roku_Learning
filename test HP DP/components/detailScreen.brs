sub init()
    m.director=m.top.findNode("director")
    m.starring=m.top.findNode("starring")
    m.Genres=m.top.findNode("Genres")
    m.bannerPoster=m.top.findNode("bannerPoster")
    m.movieTitle=m.top.findNode("movieTitle")
    m.movieSubTitle=m.top.findNode("movieSubTitle")
    m.movieDetail=m.top.findNode("movieDetail")
end sub 

function detailApi()
    m.top.parseApi=false

    itemType = m.top.contentData.itemType.ToStr()
	if itemType = "0"
		itemType = "1"
	end if
    contentId = m.top.contentData.contentId.ToStr()

    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v1/getItemDetails/"+itemType+"/"+contentId+"/MTI2MzEzfGZkNTdmODM4M2VjYTNkMDl8QW5kcm9pZCBTREsgYnVpbHQgZm9yIHg4Ng=="
    m.readContentTask.control ="RUN"
end function

function loadJson()
    json = m.readContentTask.content
    print "------------------------------>>>>>"json
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