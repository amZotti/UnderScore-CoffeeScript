obj =
  a: 1
  b: 2
  c: 3

describe "each", ->
  it "should apply the function to every value in array", ->
    arr = [1, 2, 3]
    newArr = []
    _.each(arr, (element, index) -> newArr[index] = element + 1)
    expect(newArr[0]).toEqual(2)

  it "should apply the function to every value in object", ->

    newObj = {}
    _.each(obj, (value, key) -> newObj[key] = value + 1)
    expect(newObj['a']).toEqual(2)

describe "map", ->
  it "shoud return a new array with the provided function applied to each element of an array", ->
    arr = [1, 2, 3]
    newArr = _.map(arr, (element, index) -> element * 2)
    expect(newArr).toEqual([2,4,6])

  it "should return an array with the provided function applied to each value of an object", ->
    newArr = _.map(obj, (value, key) -> obj[key] = obj[key] * 2)
    expect(newArr).toEqual([2,4,6])

describe "reduce", ->
  arr = []
  startingValue = 10
  arrayCallback = (startingValue, element, index, arr) ->
    startingValue += element

  beforeEach -> arr = [1, 2, 3]

  it "should reduce all elements of an array into one by applying the provided function", ->
    result = _.reduce(arr, arrayCallback)
    expect(result).toEqual(6)

  it "should reduce all values of an object into one by applying the provided function", ->
    obj =
      a: 1
      b: 2
      c: 3

    objCallback = (startingValue, value, key, obj) -> startingValue += value

    result = _.reduce(obj, objCallback)
    expect(result).toEqual(6)

  it "should reduce correctly when provided a starting value", ->
    result = _.reduce(arr, arrayCallback, startingValue)
    expect(result).toEqual(16)

describe "find", ->
  callback = (num)-> num % 2 is 0

  it "should return the first element in an array which passes the provided predicate callback", ->
    arr = [1, 3, 5, 8, 10, 7, 6]
    result = _.find(arr, callback)
    expect(result).toEqual(8)

  it "should return the first value in an object which passes the provided predicate callback", ->
    result = _.find(obj, callback)
    expect(result).toEqual(2)

  it "should return undefined if predicate fails every element in array", ->
    arr = [1, 3, 5]
    result = _.find(arr, callback)
    expect(result).toEqual(undefined)

describe "filter", ->
  callback = (num) -> num % 2 is 0

  it "should return all array elements in an array which pass the provided predicate callback", ->
    arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    result = _.filter(arr, callback)
    expect(result).toEqual([2, 4, 6, 8, 10])

  it "should return all object values in an array which pass the provided predicate callback", ->
    obj =
      a: 1
      b: 2
      c: 3
      d: 4
      f: 5
      g: 6

    result = _.filter(obj, callback)
    expect(result).toEqual([2, 4, 6])
