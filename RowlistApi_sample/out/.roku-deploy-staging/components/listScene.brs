sub init()
    m.RowListScene = m.top.findNode("RowListScene")
    ' RowListScene.content = CreateObject("roSGNode","listContent")
    ' print RowListScene.content
    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    m.readContentTask.contenturi="https://api.tentkotta.com/tkapi/v1/movie/getTrendingMoviesList"
    m.readContentTask.control ="RUN"

    m.top.setFocus(true)
end sub

function loadJson()
    json = m.readContentTask.content
    parentNode = CreateObject("roSGNode","ContentNode")
    shelfNode = CreateObject("roSGNode","ContentNode")
    for each item in json.response.Today
        ' print "item======================"item
        itemNode = CreateObject("roSGNode","ContentNode")
        itemNode.title = item.title
        itemNode.hdPosterURL = item.deviceImage
        shelfNode.appendChild(itemNode)
    end for
    parentNode.appendChild(shelfNode)
    m.RowListScene.content = parentNode
    m.RowListScene.visible = true
    print "..............." m.RowListScene.content
end function