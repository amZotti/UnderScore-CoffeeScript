window._ = {}
_.each = (list, callback, context = this) ->
  if Array.isArray list
    callback.call(context, item, index, list) for item, index in list
  else
    callback.call(context, value, key, list) for own key, value of list

_.map = (list, callback, context = this) ->
  callback = callback or (value) -> value
  if Array.isArray list
    (callback.call(context, item, index, list) for item, index in list)
  else
    (callback.call(context, value, key, list) for own key, value of list)

_.reduce = (list, callback, startingValue = 0, context = this) ->
  iteratee = (element, index, list) ->
    startingValue = callback.call(context, startingValue, element, index, list)
  _.each list, iteratee, context
  startingValue

_.find = (list, callback, context = this) ->
  result = undefined
  _.each list, (value, index, list) ->
    result = value if result is undefined and callback.call(context, value) is true
  result

#alias
_.detect = _.find

_.filter = (list, callback, context = this) ->
  results = []
  _.each list, (value, index, list) ->
    if callback.call(context, value) then results.push(value)
  results

#alias
_.select = _.filter

_.where = (list, properties) ->
  results = []
  _.each list, (value, index, list) ->
    if checkObjectForProperties(value, properties)
      results.push(value)
  results

checkObjectForProperties = (object, properties) ->
  for key of properties
    unless checkObjectForProperty(key, properties[key], object)
      return false
  true

checkObjectForProperty = (key, value, object) ->
  for otherKey of object
    if otherKey is key and value is object[key]
      return true
  false

_.findWhere = (list, properties) ->
  _.where(list, properties)[0]


_.reject = (list, callback, context = this) ->
  _.filter list, (value) ->
    !callback.call(context, value)

_.every = (list, callback, context = this) ->
  status = true
  _.each list, (value) ->
    unless callback.call(context, value)
      status = false
  status

#alias
_.all = _.every

_.some = (list, callback, context = this) ->
  _.filter(list, callback, context).length isnt 0

#alias
_.any = _.some

_.contains = (list, value) ->
  _.some list, (element) -> element is value

#alias
_.include = _.contains

_.invoke = (list, methodName) ->
  args = [].slice.call(arguments, 2)
  _.map list, (value) ->
    value[methodName].apply(value, args)

_.pluck = (list, key) ->
  _.map(list, (obj) -> obj[key])

_.max = (list, callback, context = this) ->
  result = undefined
  maxVal = undefined
  _.each list, (value) ->
    if callback
      count = callback.call(context, value)
    else
      count = value
    maxVal = maxVal or count
    result = result or value
    if count > maxVal
      result = value
  result or Number.POSITIVE_INFINITY


_.min = (list, callback, context = this) ->
  result = undefined
  minVal = undefined
  _.each list, (value) ->
    if callback
      count = callback.call(context, value)
    else
      count = value
    minVal = minVal or count
    result = result or value
    if count < minVal
      result = value
  result or Number.POSITIVE_INFINITY

_.sortBy = (list, iteratee, context = this) ->
  _.map _.map(list, ((value) ->
    {key: iteratee(value), value: value}), context).sort((a,b) ->
      a.key > b.key),
      (obj) -> obj.value,
      context

_.organizeBy = (list, iteratee)->
  getKey = (value, iteratee) ->
    if typeof iteratee is "string"
      value[iteratee]
    else
      iteratee(value)

  _.map list, (value) ->
    key: getKey(value, iteratee)
    value: value

_.groupBy = (list, iteratee, context = this) ->
  result = {}
  _.each _.organizeBy(list, iteratee, context), (obj) ->
    if result[obj.key] is undefined
      result[obj.key] = []
    result[obj.key].push(obj.value)
  result

_.indexBy = (list, iteratee, context = this) ->
  result = {}
  _.each _.organizeBy(list, iteratee, context), (obj) ->
    result[obj.key] = obj.value
  result

_.countBy = (list, iteratee, context = this) ->
  result = {}
  _.each _.organizeBy(list, iteratee, context), (obj) ->
    if result[obj.key] is undefined
      result[obj.key] = 0
    result[obj.key] += 1
  result

_.objectValuesToArray = (list) ->
  if not Array.isArray(list)
    list = _.map list,
    (value) -> value
  else
    list

_.randomIndex = (size) ->
    Math.floor(Math.random() * size)

_.shuffle = (list) ->
  list = _.objectValuesToArray(list)
  size = list.length

  popRandomElementFrom = (list, index) ->
    item = list[index]
    list[index] = list[size]
    size -= 1
    item

  _.map [1..size], ->
    popRandomElementFrom list,
    _.randomIndex(list)

_.sample = (list, n = 1) ->
  list = _.objectValuesToArray(list)
  _.map [1..n], ->
    list[_.randomIndex(list.length)]

_.toArray = (list) ->
  _.map list, (value) ->
    value

