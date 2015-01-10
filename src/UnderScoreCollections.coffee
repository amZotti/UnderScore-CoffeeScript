window._ = {}
_.each = (container, callback) ->
  if Array.isArray(container)
    for item, index in container 
      callback(item, index, container)
  else
    for own key, value of container 
      callback(value, key, container)

_.map = (container, callback) ->
  newArr = []
  if Array.isArray(container)
    for item, index in container
      newArr.push callback(item, index, container)
  else
    for own key, value of container
      newArr.push callback(value, key, container)
  newArr
