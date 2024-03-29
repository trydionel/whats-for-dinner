App.factory 'Recipe', ['$q', '$http', ($q, $http) ->
  promise = $http.get('/recipes')

  {
    reload: ->
      promise = $http.get('/recipes')

    all: ->
      results = []
      results.promise = promise.success (recipes) ->
        angular.copy(recipes, results)

      results

    sample: (n, fn = angular.identity) ->
      results = []
      results.promise = promise.success (recipes) ->
        candidates = recipes.filter(fn)
        total = candidates.length

        indices = []
        N = Math.min(n, total)
        until indices.length == N
          i = Math.floor(Math.random() * total)
          indices.push(i) unless indices.indexOf(i) >= 0

        selection = (candidates[index] for index in indices)
        angular.copy(selection, results)

      results

    save: (recipe) ->
      result = $http.post('/recipes', recipe)
      result.success => this.reload()
      result

    destroy: (recipe) ->
      result = $http.delete("/recipes/#{recipe.id}")
      result.success => this.reload()
      result
  }
]
