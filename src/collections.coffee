window._ = {}
_.each = (container, callback) ->
  if Array.isArray container
    callback item, index, container for item, index in container
  else
    callback value, key, container for own key, value of container

_.map = (container, callback) ->
  if Array.isArray container
    (callback item, index, container for item, index in container)
  else
    (callback value, key, container for own key, value of container)

_.reduce = (container, callback, startingValue = 0) ->
  _.each container, (element, index, container) ->
    startingValue = callback startingValue, element, index, container
  startingValue

_.find = (container, callback) ->
  result = undefined
  _.each container, (value, index, container) ->
    result = value if result is undefined and callback(value) is true
  result

#alias
_.detect = _.find

_.filter = (container, callback) ->
  results = []
  _.each container, (value, index, container) ->
    if callback(value) then results.push(value)
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


_.reject = (container, callback) ->
  _.filter container, (value) ->
    !callback(value)

_.every = (container, callback) ->
  status = true
  _.each container, (value) ->
    unless callback(value)
      status = false
  status

#alias
_.all = _.every

_.some = (container, callback) ->
  _.filter(container, callback).length isnt 0

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
