if Teams.find().count()==0
  teams = [
    {name: 'Barcelona'}
    {name: 'Real madrid'}
  ]
  for data in teams
    Teams.insert(data)

if Games.find().count()==0
  game = {
    completed: false
    created_at: new Date
    teams: [
      {name: 'Barcelona', id: '1', score: 0}
      {name: 'Manchester City', id: '2', score: 0}
    ]
  }
  Games.insert(game)