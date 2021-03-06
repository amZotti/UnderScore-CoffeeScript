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

_.union = (arrays...) ->
  _.uniq _.flatten arrays

_.zip = (arrays...) ->
  longestArray = _.sortBy(arrays, (array) -> -array.length)[0]
  _.map longestArray, (value, index) ->
    _.map arrays, (array) ->
      array[index]

log = (value) ->
  console.log(JSON.stringify(value))

format = (arrays) ->
  if arrays.length is 2
    arrays = _.zip(arrays[0], arrays[1])
  else
    arrays = arrays[0]

_.object = (arrays...) ->
  arrays = format arrays
  result = {}
  _.each arrays, (array) ->
    result[array[0]] = array[1]
  result

_.indexOf = (array, value) ->
  (_.first _.compact _.map array, (item, index) ->
    if item is value then return index) or -1

_.intersection = (arrays...) ->
  _.compact _.map arrays[0], (item) ->
    item if _.every arrays, (array) -> item in array

_.difference = (array, others...) ->
  others = _.flatten(others)
  _.reject array, (value) ->
    value in others

_.lastIndexOf = (array, value, fromIndex = 0) ->
  (_.last _.compact _.map array, (item, index) ->
    if fromIndex <= index and item is value then return index) or -1

_.transform = (value, iteratee) ->
  if typeof iteratee is 'string'
    value[iteratee]
  else if typeof iteratee is 'undefined'
    value
  else
    iteratee.call this, value

_.sortedIndex = (array, value, iteratee) ->
  value = _.transform(value, iteratee)
  _.first _.compact _.map array, (item, index) ->
    if _.transform(item, iteratee) >= value then return index

_.range = (start, stop, step = 1) ->
  stop = stop or start
  if start is stop then start = 0
  (i for i in [start...stop] by step)
