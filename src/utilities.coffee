
_.identity = (value) -> value

_.constant = (value) ->
  -> value

_.noop = -> undefined

_.times = (n, iteratee, context) ->
  iteratee.call(context, i) for i in [1..n]

_.random = (min = 0, max) ->
  min + Math.floor(Math.random() * (max - min + 1))
