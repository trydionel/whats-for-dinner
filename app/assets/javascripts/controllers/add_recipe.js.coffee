App.controller 'AddRecipeCtrl', ['$scope', 'Recipe', ($scope, Recipe) ->

  $scope.submit = ->
    Recipe.save($scope.recipe).success ->
      $scope.lastRecipe = angular.copy($scope.recipe)
      $scope.recipe = {}

  $scope.hideAlert = ->
    $scope.lastRecipe = null
]
