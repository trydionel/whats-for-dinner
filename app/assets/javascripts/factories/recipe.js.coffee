App.factory 'Recipe', ($q, $http) ->
  promise = $http.get('/recipes')

  {
    reload: ->
      promise = $http.get('/recipes')

    all: ->
      results = []
      results.promise = promise.success (recipes) ->
        results.push(recipe) for recipe in recipes

      results

    sample: (n, fn = angular.identity) ->
      results = []
      results.promise = promise.success (recipes) ->
        candidates = recipes.filter(fn)
        length = candidates.length
        return [] if length == 0

        indices = []
        until indices.length == n
          i = Math.floor(Math.random() * length)
          indices.push(i) unless indices.indexOf(i) >= 0

        results.push(candidates[index]) for index in indices

      results

    save: (recipe) ->
      result = $http.post('/recipes', recipe)
      result.success => this.reload()
      result
  }
