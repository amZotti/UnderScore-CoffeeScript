_.keys = (obj) ->
  _.map obj, (value, key) -> key

_.values = (obj) ->
  _.map obj, (value) -> value

_.pairs = (obj) ->
  _.map obj, (value, key) -> [key, value]

_.invert = (obj) ->
  _.each obj, (value, key) ->
    obj[value] = key
    delete obj[key]
  obj
