App.filter 'startFrom',  ->
  (input, start) ->
    input.slice parseInt(start)
