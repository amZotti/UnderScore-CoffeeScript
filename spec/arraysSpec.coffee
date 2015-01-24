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
