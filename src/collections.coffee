window._ = {}
_.each = (container, callback, context = this) ->
  if Array.isArray container
    callback.call(context, item, index, container) for item, index in container
  else
    callback.call(context, value, key, container) for own key, value of container

_.map = (container, callback, context = this) ->
  callback = callback or (value) -> value
  if Array.isArray container
    (callback.call(context, item, index, container) for item, index in container)
  else
    (callback.call(context, value, key, container) for own key, value of container)

_.reduce = (container, callback, startingValue = 0, context = this) ->
  iteratee = (element, index, container) ->
    startingValue = callback.call(context, startingValue, element, index, container)
  _.each container, iteratee, context
  startingValue

_.find = (container, callback, context = this) ->
  result = undefined
  _.each container, (value, index, container) ->
    result = value if result is undefined and callback.call(context, value) is true
  result

#alias
_.detect = _.find

_.filter = (container, callback, context = this) ->
  results = []
  _.each container, (value, index, container) ->
    if callback.call(context, value) then results.push(value)
  results

#alias
_.select = _.filter

_.where = (container, properties) ->
  results = []
  _.each container, (value, index, container) ->
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

_.findWhere = (container, properties) ->
  _.where(container, properties)[0]


_.reject = (container, callback, context = this) ->
  _.filter container, (value) ->
    !callback.call(context, value)

_.every = (container, callback, context = this) ->
  status = true
  _.each container, (value) ->
    unless callback.call(context, value)
      status = false
  status

#alias
_.all = _.every

_.some = (container, callback, context = this) ->
  _.filter(container, callback, context).length isnt 0

#alias
_.any = _.some

_.contains = (container, value) ->
  _.some container, (element) -> element is value

#alias
_.include = _.contains

_.invoke = (container, methodName) ->
  args = [].slice.call(arguments, 2)
  _.map container, (value) ->
    value[methodName].apply(value, args)

_.pluck = (container, key) ->
  _.map(container, (obj) -> obj[key])

_.max = (container, callback, context = this) ->
  result = undefined
  maxVal = undefined
  _.each container, (value) ->
    if callback
      count = callback.call(context, value)
    else
      count = value
    maxVal = maxVal or count
    result = result or value
    if count > maxVal
      result = value
  result or Number.POSITIVE_INFINITY


_.min = (container, callback, context = this) ->
  result = undefined
  minVal = undefined
  _.each container, (value) ->
    if callback
      count = callback.call(context, value)
    else
      count = value
    minVal = minVal or count
    result = result or value
    if count < minVal
      result = value
  result or Number.POSITIVE_INFINITY

_.sortBy = (container, iteratee) ->
  _.map _.map(container, (value) ->
    {key: iteratee(value), value: value}).sort((a,b) ->
      a.key > b.key), (obj) ->
        obj.value


_.organizeBy = (container, iteratee)->
  getKey = (value, iteratee) -> 
    if typeof iteratee is "string"
      value[iteratee]
    else
      iteratee(value)

  _.map container, (value) ->
    key: getKey(value, iteratee)
    value: value

_.groupBy = (container, iteratee) ->
  result = {}
  _.each _.organizeBy(container, iteratee), (obj) ->
    if result[obj.key] is undefined
      result[obj.key] = []
    result[obj.key].push(obj.value)
  result

_.indexBy = (container, iteratee) ->
  result = {}
  _.each _.organizeBy(container, iteratee), (obj) ->
    result[obj.key] = obj.value
  result

_.countBy = (container, iteratee) ->
  result = {}
  _.each _.organizeBy(container, iteratee), (obj) ->
    if result[obj.key] is undefined
      result[obj.key] = 0
    result[obj.key] += 1
  result

