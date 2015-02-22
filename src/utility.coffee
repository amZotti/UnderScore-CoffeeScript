# noConflict

# Identity
_.identity = (value) -> value

# Constant
_.constant = (value) ->
	-> value

# Noop
_.noop = -> undefined

# Times
_.times = (n, iteratee, context, args...) ->
	iteratee.apply(context, args) for i in [0..n]

# Random
_.random = (min = 0, max) ->
	min + Math.floor(Math.random() * (max - min + 1));
