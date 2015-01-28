describe 'objects', ->
  describe '_.keys', ->
    it 'should return all of the names of the object\'s properties', ->
      results = _.keys({one: 1, two: 2, three: 3})
      expect(results).toEqual(['one', 'two', 'three'])

  describe '_.values', ->
    it 'should return all of the values of the object\'s properties', ->
      results = _.values({one: 1, two: 2, three: 3})
      expect(results).toEqual([1, 2, 3])

  describe '_.pairs', ->
    it 'should convert an object into a list of [key, value] pairs', ->
      results = _.pairs({one: 1, two: 2, three: 3})
      expect(results).toEqual([["one", 1], ["two", 2], ["three", 3]])

  describe '_.invert', ->
    it 'should return an object where the keys and values have been swapped', ->
      results = _.invert({Moe: "Moses", Larry: "Louis", Curly: "Jerome"})
      expect(results).toEqual({Moses: "Moe", Louis: "Larry", Jerome: "Curly"})

  describe '_.functions', ->
    it 'should return a sorted list of the names of every method in an object', ->
      results = _.functions(_)
      expect(results.length).not.toEqual(0)
