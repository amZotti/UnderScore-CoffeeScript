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



