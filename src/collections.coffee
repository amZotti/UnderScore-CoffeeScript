window._ = {}
_.each = _.forEach = (list, callback, context = @) ->
  if Array.isArray list
    callback.call(context, item, index, list) for item, index in list
  else
    callback.call(context, value, key, list) for own key, value of list


_.map = _.collect = (list, callback, context = @) ->
  callback = callback or (value) -> value
  if Array.isArray list
    (callback.call(context, item, index, list) for item, index in list)
  else
    (callback.call(context, value, key, list) for own key, value of list)

_.reduce = _.inject = _.foldl = (list, callback, startingValue = 0, context = @) ->
  iteratee = (element, index, list) ->
    startingValue = callback.call(context, startingValue, element, index, list)
  _.each list, iteratee, context
  startingValue

_.reduceRight = _.foldr = (list, callback, startingValue = 0, context = @) ->
  _.reduce(list.reverse(), callback, startingValue, context)

_.find = _.detect = (list, callback, context = @) ->
  result = undefined
  _.each list, (value, index, list) ->
    result = value if result is undefined and callback.call(context, value) is true
  result

_.filter = _.select = (list, callback, context = @) ->
  results = []
  _.each list, (value, index, list) ->
    if callback.call(context, value) then results.push(value)
  results

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


_.reject = (list, callback, context = @) ->
  _.filter list, (value) ->
    !callback.call(context, value)

_.every = _.all = (list, callback, context = @) ->
  status = true
  _.each list, (value) ->
    unless callback.call(context, value)
      status = false
  status

_.some = _.any = (list, callback, context = @) ->
  _.filter(list, callback, context).length isnt 0

_.contains = _.include = (list, value) ->
  _.some list, (element) -> element is value

_.invoke = (list, methodName) ->
  args = [].slice.call(arguments, 2)
  _.map list, (value) ->
    value[methodName].apply(value, args)

_.pluck = (list, key) ->
  _.map(list, (obj) -> obj[key])

_.maxOrMin = (list, callback, context, equality) ->
  result = undefined
  m = undefined
  _.each list, (value) ->
    if callback
      count = callback.call(context, value)
    else
      count = value
    m = m or count
    result = result or value
    if equality(m, count)
      result = value
  result or Number.POSITIVE_INFINITY

_.max = (list, callback, context = @) ->
  _.maxOrMin list,
  callback,
  context,
  (m, count) ->
    count > m

_.min = (list, callback, context = @) ->
  _.maxOrMin list,
  callback,
  context,
  (m, count) ->
    count < m

_.sortBy = (list, iteratee, context = @) ->
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

_.groupBy = (list, iteratee, context = @) ->
  result = {}
  _.each _.organizeBy(list, iteratee, context), (obj) ->
    if result[obj.key] is undefined
      result[obj.key] = []
    result[obj.key].push(obj.value)
  result

_.indexBy = (list, iteratee, context = @) ->
  result = {}
  _.each _.organizeBy(list, iteratee, context), (obj) ->
    result[obj.key] = obj.value
  result

_.countBy = (list, iteratee, context = @) ->
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

_.size = (list) ->
  _.toArray(list).length

_.partition = (array, callback) ->
  [_.filter(array, callback), _.reject(array, callback)]
