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
