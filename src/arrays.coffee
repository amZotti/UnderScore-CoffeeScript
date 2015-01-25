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

flatten = (array, shallow, results, pushNextItem = true) ->
  for item in array
    isArray = Array.isArray item
    if isArray is true and pushNextItem is false then results.push item
    else if isArray is true and shallow is false then flatten item, shallow, results
    else if isArray is true and shallow is true then flatten item, shallow, results, false
    else results.push item

_.flatten = (array, shallow = false) ->
  results = []
  flatten(array, shallow, results)
  results

_.without = (array, values...) ->
  _.reject array, (value) ->
    value in values

_.uniq = _.unique = (array, iteratee = (value) -> value) ->
  results = []
  _.filter array, (value) ->
    unless _.contains(results, iteratee value)
      results.push iteratee value
