App.controller 'RecipesCtrl', ['$scope', 'Recipe', ($scope, Recipe) ->
  $scope.offset = 0
  $scope.perPage = 5
  $scope.recipes = Recipe.all()

  $scope.paginate = (page) ->
    $scope.offset = page * $scope.perPage

  $scope.hasNextPage = ->
    $scope.offset + $scope.perPage <= $scope.recipes.length

  $scope.nextPage = ->
    if $scope.hasNextPage()
      $scope.offset += $scope.perPage

  $scope.hasPrevPage = ->
    $scope.offset - $scope.perPage >= 0

  $scope.prevPage = ->
    if $scope.hasPrevPage()
      $scope.offset -= $scope.perPage

  $scope.pages = ->
    upper = Math.ceil($scope.recipes.length / $scope.perPage)
    [0...upper]

  $scope.isCurrent = (page) ->
    page * $scope.perPage == $scope.offset
]
