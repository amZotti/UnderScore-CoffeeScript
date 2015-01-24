_.first = _.head = _.take = (array, n = 0) ->
  if n is 0 then return array[0]
  if n >= _.size(array) then return array
  _.map [0...n], (value) -> array[value]

_.initial = (array, n = 0) ->
  if n is 0 then return array.pop() and array
  if n >= _.size(array) then return []
  _.map [0..._.size(array) - n], (value) -> array[value]

_.last = (array, n = 0) ->
  size = _.size array
  if n is 0 then return array[size - 1]
  if n >= size then return array
  _.map [n - 1...size], (value) -> array[value]

_.rest = (array, index = 1) ->
  size = _.size array
  if index >= size then return []
  _.map [index...size], (value) -> array[value]
