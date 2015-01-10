describe "each", ->
  it "should apply the function to every value in array", ->
    arr = [1, 2, 3]
    newArr = []
    _.each(arr, (element, index) -> newArr[index] = element + 1)
    expect(newArr[0]).toEqual(2)

  it "should apply the function to every value in object", ->
    obj =  {
      a: 1
      b: 2
      c: 3
    }
    newObj = {}
    _.each(obj, (value, key) -> newObj[key] = value + 1)
    expect(newObj['a']).toEqual(2)

describe "map", ->
  it "shoud return a new array with the provided function applied to each element of an array", ->
    arr = [1, 2, 3]
    newArr = _.map(arr, (element, index) -> element * 2)
    expect(newArr).toEqual([2,4,6])
  
  it "should return an array with the provided function applied to each value of an object", ->
    obj = {
      a: 1
      b: 2
      c: 3
    }
    newArr = _.map(obj, (value, key) -> obj[key] = obj[key] * 2)
    expect(newArr).toEqual([2,4,6])



