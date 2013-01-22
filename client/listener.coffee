# Listener =
#   id: null
#   callback: null
#   connection: null
#   congregation: null
# 
#   start: (@callback) ->
#     @connection = Connections.findOne()
#     
#     
#     console.log @connection
#     
#     @createConnection()
#     #@startStream()
# 
#   createConnection: ->
#     connection = new webkitRTCPeerConnection(null)
#     
#     connection.onicecandidate = (event) =>
#       Connections.update connection, $push: { candidates: event.candidate }
#     
#     connection.createAnswer (answer) =>
#       console.log 'create Answer'
#       
#       connection.setRemoteDescription(new RTCSessionDescription(@connection.offer))
#       connection.setLocalDescription answer
#       
#       Connections.update @connection._id, $set: { answer: answer }
#     
#     
#     
#     
#     connection.onaddstream = (event) =>
#       url = webkitURL.createObjectURL(event.stream)
#       
#       @callback.call(@, url)
