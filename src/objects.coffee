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

_.functions = _.methods = (obj) ->
  _.compact _.map obj, (value, key) ->
    if typeof value is 'function' then key

_.extend = (destination, sources...) ->
  _.each sources, (obj) ->
    _.each obj, (value, key) ->
      destination[key] = value
  destination

_.isFunction = (object) ->
  typeof object is 'function'

_.isElement = (obj) -> 
  not not (obj and obj.nodeType is 1)

_.isArray = (obj) ->
  Array.isArray(obj)

_.isObject = (value) ->
  typeof value is 'function' or typeof value is 'object'

_.isArgument = (obj) ->
  obj.toString() is "[object Arguments]"

_.isNumber = (value) ->
  typeof value is 'number' or typeof value is 'NaN'

_.isString = (value) ->
  typeof value is 'string'

_.isBoolean = (value) ->
  typeof value is 'boolean'

_.isDate = (value) ->
  value instanceof Date

_.isRegExp = (value) ->
  value instanceof RegExp

_.isNaN = (value) ->
  Number.isNaN(value)

_.isUndefined = (value) ->
  value is undefined

_.isNull = (value) ->
  value is null

_.isFinite = (value) ->
  isFinite(value) and not isNaN(parseFloat(value))

filterObject = (whiteList, obj, keys...) ->
  keys = _.flatten(keys, true)
  fn = keys[0]
  result = {}
  _.each obj, (value, key) ->
      containsValue =  _.isFunction(fn) and fn(value) or key in keys
      if whiteList and containsValue or not whiteList and not containsValue
          result[key] = value
  result

_.pick = (obj, keys...) ->
  filterObject(true, obj, _.flatten(keys, true))

_.omit = (obj, keys...) ->
  filterObject(false, obj, _.flatten(keys, true))
