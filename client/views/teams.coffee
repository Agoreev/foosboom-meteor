Template.teams.helpers
  teams: -> Teams.find()
  creating: -> Session.get 'creating'

Template.teams.events
  'click .create': (e) ->
    e.preventDefault()
    Session.set 'creating', true

  'click .cancel': (e) ->
    e.preventDefault()
    Session.set 'creating', false

  'submit form.form-create': (e) ->
    e.preventDefault()
    team = {name: e.target.name.value}
    if team.name.length
      Teams.insert team
      Session.set 'creating', false