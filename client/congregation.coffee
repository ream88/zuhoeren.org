# Congregation =
#   channel: null
#   stream: null
#   connections: []
# 
#   start: ->
#     Connections.find(id: Meteor.userId()).observe
#       changed: ->
#         console.log('some one pushed')
#     
#     
#     @requestAudio()
#     @createConnection()
# 
#   createConnection: ->
#     id = Connections.insert candidates: []
#     
#     connection = @connections[id] = new webkitRTCPeerConnection(null)
#     connection.addStream stream if @stream
#     
#     connection.onicecandidate = (event) ->
#       Connections.update id, $push: { candidates: event.candidate }
#     
#     connection.createOffer (offer) ->
#       connection.setLocalDescription offer
#       Connections.update id, $set: { offer: offer }
# 
#   requestAudio: ->
#     navigator.webkitGetUserMedia
#       audio: true
#       video: true
#       (stream) => @stream = stream
