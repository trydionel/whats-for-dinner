App.factory 'Choice', ['$q', 'Recipe', ($q, Recipe) ->
  updateChoices = (days, recipes, staples) ->
    { day: day, name: choiceFor(day, recipes, staples) } for day in days

  pick = (list) ->
    return '' if list.length == 0
    list.pop().name

  choiceFor = (day, recipes, staples) ->
    switch day
      when 'Monday', 'Wednesday'
        pick recipes
      when 'Tuesday', 'Thursday'
        if Math.random() > 0.7
          pick staples
        else
          pick recipes
      when 'Friday'
        if Math.random() > 0.6
          'Restaurant'
        else
          pick staples
      when 'Saturday', 'Sunday'
        if Math.random() > 0.6
          'Restaurant'
        else
          pick recipes
      else
        throw "Unknown day: #{day}"

  {
    choose: (days) ->
      results = []
      recipes = Recipe.sample 5, (recipe) -> !recipe.staple
      staples = Recipe.sample 2, (recipe) -> recipe.staple

      $q.all([recipes.promise, staples.promise]).then ->
        choices = updateChoices(days, recipes, staples)
        angular.copy(choices, results)

      results
  }
]
