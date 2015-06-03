
_.identity = (value) -> value

_.constant = (value) ->
  -> value

_.noop = -> undefined

_.times = (n, iteratee, context) ->
  iteratee.call(context, i) for i in [1..n]

_.random = (min, max) ->
  if min is undefined
    return NaN
  if max is undefined
    max = min
    min = 0
  min + Math.floor(Math.random() * (max - min + 1))

_.mixin = (fns) ->
  for name of fns
    _[name] = fns[name]

_.storage = {}

_.uniqueId = (name) ->
  _.storage[name] = _.storage[name] or 0
  name + ++_.storage[name]

_.escapeChar = {}
_.escapeChar['&'] = '&#38;'
_.escapeChar['<'] = '&#60;'
_.escapeChar['>'] = '&#62;'
_.escapeChar['"'] = '&#34;'
_.escapeChar['\''] = '&#39;'
_.escapeChar['`'] = '&#96;'

_.escape = (str) ->
  newStr = ''
  for i in str
    newStr += _.escapeChar[i] or i
  newStr
