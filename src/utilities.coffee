
_.identity = (value) -> value

_.constant = (value) ->
  -> value

_.noop = -> undefined

_.times = (n, iteratee, context, args...) ->
  iteratee.apply(context, args) for i in [0..n]

_.random = (min = 0, max) ->
  min + Math.floor(Math.random() * (max - min + 1))
