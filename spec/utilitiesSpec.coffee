describe 'utilities', ->
  describe 'identity', ->
    it 'should take value which returns itself', ->
      expect(_.identity(5)).toEqual(5)

  describe 'constant', ->
    it 'should create a function that returns the same value that is used as the argument of _.constant', ->
      fn = _.constant(5)
      expect(fn()).toEqual(5)

  describe 'noop', ->
    it 'should return undefined', ->
      expect(_.noop()).toEqual(undefined)

  describe 'times', ->
    it 'should invoke the given iteratee function n times', ->
      result = _.times(5, _.identity)
      expect(result).toEqual([1, 2, 3, 4, 5])

  describe 'random', ->
    it 'should return NaN if no arguments are provided', ->
      expect(_.random()).toEqual(NaN)

    it 'should return a random integer between min and max', ->
      expect(_.random(1, 1000)).not.toEqual(_.random(1, 1000))

  describe 'mixin', ->
    it 'should extend functions to underscore object', ->
      fn = (str) ->
        str.charAt(0).toUpperCase() + str.substring(1)
      _.mixin({capitalize: fn})
      result = _.capitalize("lol it works")
      expect(result).toEqual("Lol it works")

  describe 'uniqueId', ->
    it 'should generate a globally-unique id', ->
      _.uniqueId('bbq')
      _.uniqueId('bbq')
      expect(_.uniqueId('bbq')).toEqual('bbq3')

  describe 'escape', ->
    it 'Escapes a string for insertion into HTML, replacing &, <, >, ", `, and \'', ->
      expect(_.escape('<"lol">')).toEqual('&#60;&#34;lol&#34;&#62;')

