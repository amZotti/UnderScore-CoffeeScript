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
