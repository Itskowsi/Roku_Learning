sub init()
    m.director=m.top.findNode("director")
    m.starring=m.top.findNode("starring")
    m.Genres=m.top.findNode("Genres")

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
    m.director.text="<directorwhite>Director </directorwhite><directorcolor> Director </directorcolor>"
    m.starring.text="<starringwhite>Starring </starringwhite><starringcolor> Starring </starringcolor>"
    m.Genres.text="<Genreswhite>Genres </Genreswhite><Genrescolor> Genres </Genrescolor>"
end sub 