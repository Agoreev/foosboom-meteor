Template.team.helpers
  editing: -> Session.get('editing') == @_id

Template.team.events
  'click .edit': (e) ->
    e.preventDefault()
    Session.set('editing', @_id)

  'submit form.form-edit': (e) ->
    e.preventDefault()

    teamName = e.target.name.value
    if teamName.length
      Teams.update(@_id, $set: {name: teamName})
      Session.set('editing', null)

  'click .cancel': (e) ->
    e.preventDefault()
    Session.set('editing', null)

  'click .remove': (e) ->
    e.preventDefault()
    Teams.remove(@_id)