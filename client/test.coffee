Meteor.startup ->
  setVideo = (element, stream) ->
    url = webkitURL.createObjectURL(stream)
    $(element).attr src: url
  
  navigator.webkitGetUserMedia
    video: true
    audio: true
    (stream) ->
      setVideo '#local', stream
      c1 = window.c1 = new webkitRTCPeerConnection(null)
      c2 = window.c2 = new webkitRTCPeerConnection(null)
      
      c2.onaddstream = (event) ->
        console.log event
        setVideo '#remote', event.stream
      
      c1.addStream stream
      
      c1.onicecandidate = (event) ->
        console.log 1
        c2.addIceCandidate new RTCIceCandidate(event.candidate)
        
      c2.onicecandidate = (event) ->
        c1.addIceCandidate new RTCIceCandidate(event.candidate)
      
      
      c1.createOffer (offer) ->
        c1.setLocalDescription offer
        c2.setRemoteDescription offer
        
        c2.createAnswer (answer) ->
          c2.setLocalDescription answer
          c1.setRemoteDescription answer
