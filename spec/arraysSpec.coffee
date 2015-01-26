describe 'arrays', ->
  arr = null
  beforeEach ->
    arr = [5, 4, 3, 2, 1]

  describe '_.first', ->
    it 'should return the first element', ->
      result = _.first arr;
      expect(result).toEqual(5)

    it 'should return the first n elements when n is provided', ->
      result = _.first arr, 3
      expect(result).toEqual([5, 4, 3])

    it 'should return all the elements if n exceeds size', ->
      result = _.first arr, 20
      expect(result).toEqual(arr)

  describe '_.initial', ->
    it 'should return all elements except the last', ->
      result = _.initial(arr);
      expect(result).toEqual([5, 4, 3, 2])

    it 'should exclude n elements when n is provided', ->
      result = _.initial(arr, 2)
      expect(result).toEqual([5, 4, 3])

    it 'should return an empty array if n exceeds size', ->
      result = _.initial(arr, 99)
      expect(result).toEqual([])

  describe '_.last', ->
    it 'should return the last element', ->
      result = _.last(arr)
      expect(result).toEqual(1)

    it 'should accept argument n which will return last n elements', ->
      result = _.last(arr, 3)
      expect(result).toEqual([3, 2, 1])

    it 'should return the entire array if n exceeds size', ->
      result = _.last(arr, 33)
      expect(result).toEqual(arr)

  describe '_.rest', ->
    it 'should return all elements except first', ->
      result = _.rest(arr)
      expect(result).toEqual([4, 3, 2, 1])

    it 'should accept argument index which will return elements onward starting at index', ->
      result = _.rest(arr, 3)
      expect(result).toEqual([2, 1])

    it 'should return the empty array if index exceeds size', ->
      result = _.rest(arr, 33)
      expect(result).toEqual([])

  describe '_.compact', ->
    it 'should return a new array with all falsey values removed', ->
      result = _.compact([0, 1, false, 2, '', 3]);
      expect(result).toEqual([1, 2, 3])

  describe '_.flatten', ->
    it 'should flatten a nested array', ->
      result = _.flatten([1, [2], [3, [[4]]]])
      expect(result).toEqual([1, 2, 3, 4])

    it 'should flatten only a single level if shallow argument is provided', ->
      result = _.flatten([1, [2], [3, [[4]]]], true) 
      expect(result).toEqual([1, 2, 3, [[4]]])

  describe '_.without', ->
    it 'should return a copy of the array with all instances of the values passed in as arguments removed', ->
      result = _.without([1, 2, 1, 0, 3, 1, 4], 0, 1)
      expect(result).toEqual([2, 3, 4])

  describe '_.uniq', ->
    it 'should produce a duplicate free version of the array', ->
      result = _.uniq([1, 2, 1, 3, 1, 4])
      expect(result).toEqual([1, 2, 3, 4])

    it 'should compute unique items based on transformation', ->
      result = _.uniq(arr, (value) -> value % 2 is 0)
      expect(result).toEqual([5, 4])

  describe '_.union', ->
    it 'should return the list of unique items in order they appear in the passed in arrays', ->
      result = _.union([1, 2, 3], [101, 2, 1, 10], [2, 1])
      expect(result).toEqual([1, 2, 3, 101, 10])

  describe '_.zip', ->
    it 'should merge together arrays with corresponding positions', ->
      result = _.zip(['moe', 'larry', 'curly'], [30, 40, 50], [true, false, false])
      expect(result).toEqual([["moe", 30, true], ["larry", 40, false], ["curly", 50, false]])

    it 'should fill missing values in with undefined', ->
      result = _.zip([1,2,3,],['a','b'])
      expect(result).toEqual([[1, 'a'], [2, 'b'], [3, undefined]])

  describe '_.object', ->
    it 'should merge an array of keys with an array of values to creates an object', ->
      result = _.object(['moe', 'larry', 'curly'], [30, 40, 50])
      expect(result).toEqual({moe: 30, larry: 40, curly: 50})

    it 'should merge arrays of [key, value] in an array into an object', ->
      result = _.object([['moe', 30], ['larry', 40], ['curly', 50]])
      expect(result).toEqual({moe: 30, larry: 40, curly: 50})

  describe '_.indexOf', ->
    it 'should return the first index of the provided value', ->
      result = _.indexOf([1, 2, 3], 2)
      expect(result).toEqual(1)

    it 'should return -1 if value cannot be found', ->
      result = _.indexOf(arr, "barbeque")
      expect(result).toEqual(-1)
  
  describe '_.intersection', ->
    it 'should return an array with items that are present in each array arguments', ->
      result = _.intersection([1, 2, 3], [101, 2, 1, 10], [2, 1])
      expect(result).toEqual([1, 2])

  describe '_.difference', ->
  it 'should return values from array that are not present in other arrays', ->
    result = _.difference([1, 2, 3, 4, 5], [5, 2, 10])
    expect(result).toEqual([1, 3, 4])

  describe '_.lastIndexOf', ->
    it 'should return the index of the last occurrence of value in the array, or -1 if value is not present', ->
      result = _.lastIndexOf([1, 2, 3, 1, 2, 3], 2)
      expect(result).toEqual(4)

  describe '_.sortedIndex', ->
    it 'should determine where a given value will be inserted in a sorted list', ->
      result = _.sortedIndex([10, 20, 30, 40, 50], 35)
      expect(result).toEqual(3)

    it 'should determine where a given object will be inserted in a sorted list', ->
      stooges = [{name: 'moe', age: 40}, {name: 'curly', age: 60}]
      result =  _.sortedIndex(stooges, {name: 'larry', age: 50}, 'age')
      expect(result).toEqual(1)

    it 'should accept an optional callback which transforms', ->
      iteratee = (num) -> 
        if num % 2 is 0 then num + 10 else num
      result = _.sortedIndex([10, 20, 30, 40, 50], 35, iteratee)
      expect(result).toEqual(2)
  
  describe '_.range', ->
    it 'should create a range of values provided stop value', ->
      expect(_.range(10)).toEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9])

    it 'should create a range of values provided start and stop values', ->
      expect(_.range(1, 11)).toEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

    it 'should create a range of values with steps', ->
      expect(_.range(0, 30, 5)).toEqual([0, 5, 10, 15, 20, 25])

    it 'should create a range of negative values', ->
      expect(_.range(0, -10, -1)).toEqual([0, -1, -2, -3, -4, -5, -6, -7, -8, -9])

    it 'should default to empty array', ->
      expect(_.range(0)).toEqual([])
