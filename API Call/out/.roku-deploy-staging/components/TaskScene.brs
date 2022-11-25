sub init()
  m.label1 = m.top.findNode("label1")
  m.label2 = m.top.findNode("label2")
  m.label3 = m.top.findNode("label3")
  m.label4 = m.top.findNode("label4")
  m.label5 = m.top.findNode("label5")
  m.top.setFocus(true)

  m.readContentTask = CreateObject("roSGNode","ContentReader")
  m.readContentTask.observefield("content","Parse")
  ' Parse()
  m.readContentTask.contenturi="https://staging-api.tentkotta.com/tkapi/v1/user/getUserDetails/MTI2MjI4fDk1N2U3M2MwLTc2NjItNWViMC1iODNmLTgzZjY1ZjQ5MmQ4Y3xSb2t1"
  m.readContentTask.control ="RUN"

end sub

function Parse()
     json = m.readContentTask.content
     m.label1.text=json.name
     m.label2.text=json.email
     m.label3.text=json.package
     m.label4.text=json.subscriptionEndDate
     m.label5.text=json.userStatus
end function