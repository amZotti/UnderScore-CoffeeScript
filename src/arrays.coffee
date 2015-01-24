_.first = _.head = _.take = (array, n = 0) ->
  if n is 0 then return array[0]
  if n >= array.length then return array
  _.map [0...n], (value) -> array[value]

_.initial = (array, n = 0) ->
  if n is 0 then return array.pop() and array
  if n >= array.length then return []
  _.map [0..._.size(array) - n], (value) -> array[value]
