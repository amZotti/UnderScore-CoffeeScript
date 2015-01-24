_.first = (array, n) ->
  if n is undefined
    array[0]
  else if n >= array.length
    array
  else
    _.map [0...n], (value) ->
      array[value]
