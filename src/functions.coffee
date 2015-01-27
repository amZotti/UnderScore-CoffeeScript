_.bind = (fn, context, partial...) ->
  return (full...) -> 
    args = partial.concat(full)
    fn.apply(context, args)

_.bindAll = (object, functions...) ->
  _.each functions, (fn) ->
    _.bind(fn, object)
  object
