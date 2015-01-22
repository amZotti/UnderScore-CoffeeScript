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
  if Array.isArray container
    for element, index in container
      startingValue = callback startingValue, element, index, container
  else
    for own key, value of container
      startingValue = callback startingValue, value, key, container
  startingValue

_.find = (container, callback) ->
  if Array.isArray container
    result = result or element for element in container when callback(element) is true
  else
    result = result or value for own key, value of container when callback(value) is true
  result

_.filter = (container, callback) ->
  if Array.isArray container
    result = (element for element in container when callback(element) is true)
  else
    result = (value for own key, value of container when callback(value) is true)
  result

_.where = (container, properties) ->
  results = []
  if Array.isArray container
    for object in container
      if checkObjectForProperties(object, properties)
        results.push object
  else
    for key of container
      if checkObjectForProperties(container[key], properties)
        results.push container[key]
  results

checkObjectForProperties = (object, properties) ->
  for key of properties
    unless checkObjectForProperty(key, properties[key], object)
      return false
  true

checkObjectForProperty = (key, value, object) ->
  for otherKey of object
    if (otherKey is key and value is object[key])
      return true
  false

_.findWhere = (container, properties) ->
  if Array.isArray container
    for object in container
      if checkObjectForProperties(object, properties)
        return object
  else
    for key of container
      if checkObjectForProperties(container[key], properties)
        return container[key]
  undefined

_.reject = (container, callback) ->
  if Array.isArray(container)
    results = (element for element in container when callback(element) isnt true)
  else
    results = (container[key] for key of container when callback(container[key]) isnt true)

_.every = (container, callback) ->
  if Array.isArray(container)
    return false for element in container when callback(element) isnt true
  else
    return false for key of container when callback(container[key]) isnt true
  true

_.some = (container, callback) ->
  if Array.isArray(container)
    return true for element in container when callback(element)
  else
    return true for key of container when callback(container[key])
  false

_.contains = (container, value) ->
   _.some(container, (element) -> element is value)

_.invoke = (container, methodName) ->
    if Array.isArray(container)
      for element in container
        element[methodName].apply(element, [].slice.call(arguments, 2))
    else
      for key of container
        container[key][methodName].apply(container[key], [].slice.call(arguments, 2))

_.pluck = (container, key) ->
  _.map(container, (obj) -> obj[key])
