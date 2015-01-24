describe 'arrays', ->
  arr = null
  beforeEach -> 
    arr = [5, 4, 3, 2, 1]

  describe '_.first', ->
    it 'should return the first element of an array when n argument is not provided', ->
      result = _.first arr;
      expect(result).toEqual(5)

    it 'should return the first n elements of an array when passed n as an argument', ->
      result = _.first arr, 3
      expect(result).toEqual([5, 4, 3])

    it 'should return all the elements if n is greater than or equal to the arrays length', ->
      result = _.first arr, 20
      expect(result).toEqual(arr)

  describe '_.initial', ->
    it 'should return all elements except the last in the array when n argument is not provided', ->
      result = _.initial(arr);
      expect(result).toEqual([5, 4, 3, 2])

    it 'should exclude n elements when n is passed as an argument', ->
      result = _.initial(arr, 2)
      expect(result).toEqual([5, 4, 3])

    it 'should return an empty array if n exceeds the number of elements in array', ->
      result = _.initial(arr, 99)
      expect(result).toEqual([])

