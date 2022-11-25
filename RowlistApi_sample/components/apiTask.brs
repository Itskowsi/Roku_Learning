sub init()
    m.top.functionName = "getContent"
end sub

function getContent()
    content = CreateObject("roSGNode","ContentNode")
    readInternet=CreateObject("roUrlTransfer")
    port = CreateObject("roMessagePort")
    readInternet.SetMessagePort(port)
    readInternet.SetMessagePort(port)
    readInternet.SetUrl(m.top.contenturi) 
    readInternet.InitClientCertificates()
    readInternet.SetCertificatesFile("common:/certs/ca-bundle.crt")
    readInternet.SetRequest("GET")
    readInternet.AddHeader("Content-Type","application/JSON")

    if (readInternet.AsyncGetToString())
        msg = wait(0, port)
          if (type(msg) = "roUrlEvent")
                code = msg.GetResponseCode()
                if (code = 200)
                jsonResponse = ParseJSON(msg.GetString())
            end if
        end if
    end if
    m.top.content=jsonResponse
    ' print"jsonResponse============"jsonResponse
end function