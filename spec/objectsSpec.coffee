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

  describe '_.extend', ->
    it 'should copy all of the properties in the source objects over to the destination object', ->
      results = _.extend({name: 'moe'}, {age: 50})
      expect(results).toEqual({name: 'moe', age: 50})
  
  describe '_.isFunction', ->
    it 'should return true if object is a function', ->
      expect(_.isFunction(alert)).toBe(true)

  describe '_.pick', ->
    it 'should return a copy of the object, filtered to only have values for the whitelisted keys', ->
      result= _.pick({name: 'moe', age: 50, userid: 'moe1'}, 'name', 'age')
      expect(result).toEqual({name: 'moe', age: 50})

    it 'should return a copy of the object, filtered to only have values which pass the predicate', ->
      result = _.pick({name: 'moe', age: 50, userid: 'moe1'}, (value, key, object) -> typeof value is 'number')
      expect(result).toEqual({age: 50})

