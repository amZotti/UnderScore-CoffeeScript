describe 'first', ->
  arr = null
  beforeEach -> 
    arr = [5, 4, 3, 2, 1]

  it 'should return the first element of an array when no argument is provided', ->
    result = _.first arr;
    expect(result).toEqual(5)

  it 'should return the first n elements of an array when passed n as an argument', ->
    result = _.first arr, 3
    expect(result).toEqual([5, 4, 3])

  it 'should return all the elements if n is greater than or equal to the arrays length', ->
    result = _.first arr, 20
    expect(result).toEqual(arr)
