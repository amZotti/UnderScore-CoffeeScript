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

