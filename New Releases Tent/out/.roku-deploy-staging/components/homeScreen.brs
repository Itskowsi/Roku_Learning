sub init()
    m.RowListScene = m.top.findNode("RowListScene")
    m.BannerImage = m.top.findNode("BannerImage")
    m.movieTitle = m.top.findNode("movieTitle")
    m.movieSubTitle = m.top.findNode("movieSubTitle")
    m.movieDetail = m.top.findNode("movieDetail")
    m.top.setFocus(true)
end sub

function startParseApi()
    ' m.readContentTask.contenturi="https://api.tentkotta.com/tkapi/v1/movie/getTrendingMoviesList"
    m.top.parseApi=false
    m.readContentTask = CreateObject("roSGNode","TaskAPI")
    m.readContentTask.observefield("content","loadJson")
    m.readContentTask.contenturi=m.global.baseUrl + "v1/getGroupDetails/1"
    m.readContentTask.control ="RUN"
end function

function loadJson()
    json = m.readContentTask.content
    parentNode = CreateObject("roSGNode","ContentNode")
    shelfNode = CreateObject("roSGNode","ContentNode")
        ' for each item in json.response.Today
    for each item in json.response.categories[0].items
        itemNode = CreateObject("roSGNode","CustomContentNode")
        ' itemNode.title = item.title
        ' itemNode.subtitle=str(item.releaseYear)+" | "+ item.duration +" | "+item.censorCertificate
        ' itemNode.description=item.description
        itemNode.hdPosterURL = item.deviceImage
        itemNode.sdPosterUrl=item.bannerImage
        itemNode.contentId=item.contentId
        itemNode.itemType=item.itemType
        shelfNode.appendChild(itemNode)
    end for
    parentNode.appendChild(shelfNode)
    m.RowListScene.content = parentNode
    m.RowListScene.visible = true
end function

Sub OnFocused()
	OnRowlistFocuse = m.RowListScene.content.getChild(m.top.rowItemFocused[0]).getChild(m.top.rowItemFocused[1])
	m.BannerImage.uri = OnRowlistFocuse.sdPosterURL
    m.movieTitle.text= OnRowlistFocuse.title
    m.movieSubTitle.text = OnRowlistFocuse.subtitle
    m.movieDetail.text = OnRowlistFocuse.description
    print "focus............................."
End Sub

Sub OnSelected()

	OnRowlistSelected = m.RowListScene.content.getChild(m.top.rowItemSelected[0]).getChild(m.top.rowItemSelected[1])    
	m.top.contentData = OnRowlistSelected
    print "selected............................."
    m.top.ShowDetailScreen = true
End Sub