Template.games.helpers
  games: -> Games.find()
  teams: -> Teams.find()
  creating: -> Session.get 'creating-game'

Template.games.events
  'click .create': (e) ->
    e.preventDefault()
    Session.set 'creating-game', true

  'click .cancel': (e) ->
    e.preventDefault()
    Session.set 'creating-game', null

  'submit form.form-create': (e, tpl) ->
    e.preventDefault()

    teamOneData = {
      id: e.target.teamOne.value
      name: tpl.$("select[name='teamOne'] option:selected").text()
      score: 0
    }

    teamTwoData = {
      id: e.target.teamTwo.value
      name: tpl.$("select[name='teamTwo'] option:selected").text()
      score: 0
    }

    game = {
      createdAt: new Date()
      teams: [teamOneData, teamTwoData]
      completed: false
    }

    gameId = Games.insert(game)

    Teams.update({_id: teamOneData.id}, {$addToSet: {games: gameId}})
    Teams.update({_id: teamTwoData.id}, {$addToSet: {games: gameId}})