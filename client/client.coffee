# Template.congregations.helpers
#   congregations: ->
#     Meteor.users.find().fetch()
# 
# Meteor.startup ->
#   if Meteor.user()
#     Congregation.start()
#   else
#     Meteor.subscribe 'congregations', ->
#       Meteor.subscribe 'connections', ->
#         Listener.start (url) ->
#           $('video')[0].src = url
