_.bind = (fn, context, partial...) ->
  return (full...) -> 
    args = partial.concat(full)
    fn.apply(context, args)

_.bindAll = (object, functions...) ->
  _.each functions, (fn) ->
    _.bind(fn, object)
  object

fillInArguments = (partial, full) ->
  _.each partial, (arg, index) ->
    if arg is "_" then partial[index] = full.pop()
  partial.concat(full)

_.partial = (fn, partial...) ->
  return (full...) ->
    args = fillInArguments(partial, full)
    fn.apply(this, args)

_.memoize = (fn) ->
  cache = {}
  return (args...) ->
    cache[args[0]] or cache[args[0]] = fn.apply(this, args)

_.delay = (fn, wait, args...) ->
  setTimeout((-> fn.apply(fn, args)), wait)

_.defer = (fn, args...) ->
  _.delay(fn, 1, args)

_.thorttle = (fn, wait) ->
  blocking = false
  (args...) ->
    unless blocking
      fn.apply(fn, args)
      blocking = true
      _.delay((-> blocking = false), wait)

_.debounce = (fn, wait) ->
  blocking = false
  id = undefined
  (args...) ->
    unless blocking
      fn.apply(fn, args)
      blocking = true
      id = _.delay((-> blocking = false), wait)
    else
      clearTimeout(id)
      id = _.delay((-> blocking = false), wait)

_.once = (fn) ->
  called = false
  (args...) ->
    unless called
      called = true
      fn.apply(fn, args)

_.after = (count, fn) ->
  (args...) ->
    if --count < 1
      fn.apply(fn, args)

_.before = (count, fn) ->
  result = undefined
  (args...) ->
    if 0 < --count
      result = fn.apply(fn, args)
    else
      result

_.wrap = (fn, wrapper) ->
  (args...) -> 
    args.unshift(fn)
    wrapper.apply(wrapper, args)
