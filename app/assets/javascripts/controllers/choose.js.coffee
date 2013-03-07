App.controller 'ChooseCtrl', ['$scope', '$q', 'Recipe', ($scope, $q, Recipe) ->
  $scope.days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ]

  $scope.recipes = []
  $scope.staples = []
  $scope.picked  = []
  $scope.choices = []

  $scope.reload = ->
    $scope.recipes = Recipe.sample(5)
    $scope.staples = Recipe.sample 2, (recipe) -> recipe.staple
    $q.all(
      $scope.recipes.promise,
      $scope.staples.promise
    ).then updateChoices

  updateChoices = ->
    $scope.picked = []
    $scope.choices = ({ day: day, name: choiceFor(day) } for day in $scope.days)

  pick = (list) ->
    indices = [0...list.length]
    for index in indices
      candidate = list[index]
      entry = candidate if $scope.picked.indexOf(candidate) == -1
      break if entry
    return '' if !entry

    $scope.picked.push(entry)
    entry.name

  choiceFor = (day) ->
    switch day
      when 'Monday', 'Wednesday'
        pick $scope.recipes
      when 'Tuesday', 'Thursday'
        if Math.random() > 0.7
          pick $scope.staples
        else
          pick $scope.recipes
      when 'Friday'
        if Math.random() > 0.6
          'Restaurant'
        else
          pick $scope.staples
      when 'Saturday', 'Sunday'
        if Math.random() > 0.6
          'Restaurant'
        else
          pick $scope.recipes
      else
        throw "Unknown day: #{day}"
]
