describe 'objects', ->
  describe '_.keys', ->
    it 'should return all of the names of the object\'s properties', ->
      results = _.keys({one: 1, two: 2, three: 3})
      expect(results).toEqual(['one', 'two', 'three'])

  describe '_.values', ->
    it 'should return all of the values of the object\'s properties', ->
      results = _.values({one: 1, two: 2, three: 3})
      expect(results).toEqual([1, 2, 3])


