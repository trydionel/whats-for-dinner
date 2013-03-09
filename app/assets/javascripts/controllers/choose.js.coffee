App.controller 'ChooseCtrl', ['$scope', 'Choice', ($scope, Choice) ->
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
    $scope.choices = Choice.choose($scope.days)

  $scope.reload()
]
