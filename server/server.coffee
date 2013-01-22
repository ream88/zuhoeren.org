Meteor.publish 'congregations', ->
  Meteor.users.find()

Meteor.publish 'connections', ->
  Connections.find()

Meteor.startup ->
  Connections.remove {}
