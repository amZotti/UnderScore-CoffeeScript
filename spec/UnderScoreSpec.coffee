describe "each", ->
  it "should apply the function to every value in array", ->
    arr = [1, 2, 3]
    newArr = []
    _.each(arr, (element, index) -> newArr[index] = element + 1)
    expect(newArr[0]).toEqual(2)

  it "should apply the function to every value in object", ->
    obj =
      a: 1
      b: 2
      c: 3

    newObj = {}
    _.each(obj, (value, key) -> newObj[key] = value + 1)
    expect(newObj['a']).toEqual(2)

describe "map", ->
  it "shoud return a new array with the provided function applied to each element of an array", ->
    arr = [1, 2, 3]
    newArr = _.map(arr, (element, index) -> element * 2)
    expect(newArr).toEqual([2,4,6])

  it "should return an array with the provided function applied to each value of an object", ->
    obj =
      a: 1
      b: 2
      c: 3

    newArr = _.map(obj, (value, key) -> obj[key] = obj[key] * 2)
    expect(newArr).toEqual([2,4,6])

describe "reduce", ->
  arr = []
  startingValue = 10
  arrayCallback = (startingValue, element, index, arr) ->
    startingValue += element

  beforeEach ->
    arr = [1, 2, 3]

  it "should reduce all elements of an array into one by applying the provided function", ->
    result = _.reduce(arr, arrayCallback)
    expect(result).toEqual(6)

  it "should reduce correctly when provided a starting value", ->
    result = _.reduce(arr, arrayCallback, startingValue)
    expect(result).toEqual(16)

  it "should reduce all values of an object into one by applying the provided function", ->
    obj =
      a: 1
      b: 2
      c: 3

    objCallback = (startingValue, value, key, obj) ->
      startingValue += value

    result = _.reduce(obj, objCallback)
    expect(result).toEqual(6)
