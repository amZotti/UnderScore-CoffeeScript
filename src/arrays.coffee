_.first = _.head = _.take = (array, n = 0) ->
  if n is 0 then return array[0]
  if n >= _.size(array) then return array
  array[...n]

_.initial = (array, n = 0) ->
  if n is 0 then return array[..-2]
  array[... -n]

_.last = (array, n = 0) ->
  size = _.size array
  if n is 0 then return array[size - 1]
  if n >= size then return array
  array[n - 1..]

_.rest = _.tail = _.drop = (array, index = 1) ->
  if index >= _.size array then return []
  array[index..]

_.compact = (array) ->
  _.filter array, (value) ->
    not not value
