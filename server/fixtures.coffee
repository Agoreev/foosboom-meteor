if Teams.find().count()==0
  teams = [
    {name: 'Barcelona'}
    {name: 'Real madrid'}
  ]
  for data in teams
    Teams.insert(data)