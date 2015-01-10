window._ = {}
_.each = (container, callback) ->
  if Array.isArray(container)
    for item, index in container 
      callback(item, index, container)
  else
    for own key, value of container 
      callback(value, key, container)
