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

  it "should apply the function in the context of the object passed in", ->
    arr = [1, 2, 3]
    results = {}
    _.each(arr, ((value, index) -> this[index] = value), results)
    expect(results).toEqual({0: 1, 1: 2, 2: 3})

describe "map", ->
  it "shoud return a new array with the provided function applied to each element of an array", ->
    arr = [1, 2, 3]
    newArr = _.map(arr, (element, index) -> element * 2)
    expect(newArr).toEqual([2,4,6])

  it "should return an array with the provided function applied to each value of an object", ->
    newArr = _.map(obj, (value, key) -> obj[key] = obj[key] * 2)
    expect(newArr).toEqual([2,4,6])

  it "should apply the function in the context of the object passed in", ->
    arr = [1, 2, 3]
    results = {}
    _.map(arr, ((value, index) -> this[index] = value), results)
    expect(results).toEqual({0: 1, 1: 2, 2: 3})

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

  it "should apply the function in the context of the object passed in", ->
    context = {}
    contextCallback = (startingValue, element, index, arr) ->
      startingValue += element
      this.value = startingValue
    _.reduce(arr, contextCallback, startingValue, context)
    expect(context.value).toEqual(16)

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

describe "where", ->
  arrayOfHomes = [
    {location: "Paris Island", age: 18}
      {location: "29 Palms", age: 18}
      {location: "Camp Lejeune", age: 19}
      {location: "Iraq", age: 20}
      {location: "Camp Lejeune", age: 20}
      {location: "Mesa Verda", age: 22}
  ]

  objectOfHomes =
    a: {location: "Paris Island", age: 18}
    b: {location: "29 Palms", age: 18}
    c: {location: "Camp Lejeune", age: 19}
    d: {location: "Iraq", age: 20}
    e: {location: "Camp Lejeune", age: 20}
    f: {location: "Mesa Verda", age: 22}

  it "should returns all matching key/value pairs from array of objects", ->
    result = _.where(arrayOfHomes, {age: 18})
    expect(result).toEqual([{location: "Paris Island", age: 18}, {location: "29 Palms", age: 18}])

  it "should returns all matching key/value pairs from an object of objects", ->
    result = _.where(objectOfHomes, {age: 18})
    expect(result).toEqual([{location: "Paris Island", age: 18}, {location: "29 Palms", age: 18}])

  it "should return an empty array when there are no matches", ->
    result = _.where(arrayOfHomes, {age: 28})
    expect(result).toEqual([])


describe "findWhere", ->
  arrayOfHomes = [
    {location: "Paris Island", age: 18}
      {location: "29 Palms", age: 18}
      {location: "Camp Lejeune", age: 19}
      {location: "Iraq", age: 20}
      {location: "Camp Lejeune", age: 20}
      {location: "Mesa Verda", age: 22}
  ]

  objectOfHomes =
    a: {location: "Paris Island", age: 18}
    b: {location: "29 Palms", age: 18}
    c: {location: "Camp Lejeune", age: 19}
    d: {location: "Iraq", age: 20}
    e: {location: "Camp Lejeune", age: 20}
    f: {location: "Mesa Verda", age: 22}

  it "should return the first matching key/value pairs from array of objects", ->
    result = _.findWhere(arrayOfHomes, {age: 18})
    expect(result).toEqual({location: "Paris Island", age: 18})

  it "should return the first matching key/value pairs from an object of objects", ->
    result = _.findWhere(objectOfHomes, {age: 18})
    expect(result).toEqual({location: "Paris Island", age: 18})

  it "should return undefined when there are no matches", ->
    result = _.findWhere(arrayOfHomes, {age: 28})
    expect(result).toEqual(undefined)

describe "reject", ->

  arr = [1, 2, 3, 4, 5, 6]
  rejectObj = {a: 1, b: 2, c: 3, d: 4}
  callback = (value) -> value % 2 is 0

  it "should return only values from array which fail the predicate callback", ->
    result = _.reject(arr, callback)
    expect(result).toEqual([1, 3, 5])

  it "should return only values from object which fail the predicate callback", ->
    result = _.reject(rejectObj, callback)
    expect(result).toEqual([1, 3])

describe "every", ->

  everyArr1 = [1, 2, 3, 4, 5, 6]
  everyArr2 = [2, 4, 6]
  everyObj1 = {a: 1, b: 2, c: 3, d: 4}
  everyObj2 = {a: 2, b: 4, c: 6}
  callback = (value) -> value % 2 is 0

  it "should return false if a single value in array fails predicate callback", ->
    result = _.every(everyArr1, callback)
    expect(result).toBe(false)

  it "should return true only if all values in array pass predicate callback", ->
    result = _.every(everyArr2, callback)
    expect(result).toBe(true)

  it "should return false if a single value in object fails predicate callback", ->
    result = _.every(everyObj1, callback)
    expect(result).toBe(false)

  it "should return true only if all values in object pass predicate callback", ->
    result = _.every(everyObj2, callback)
    expect(result).toBe(true)

describe "some", ->

  someArr1 = [1, 2, 3, 4, 5, 6]
  someArr2 = [1, 3, 5]
  someObj1 = {a: 1, b: 2, c: 3, d: 4}
  someObj2 = {a: 1, b: 3, c: 9}
  callback = (value) -> value % 2 is 0

  it "should return true if any of the values in the array evaluate to true when passed predicate callback", ->
    result = _.some(someArr1, callback)
    expect(result).toBe(true)

  it "should return false if all values in array evaluate to false when passed predicate callback", ->
    result = _.some(someArr2, callback)
    expect(result).toBe(false)

  it "should return true if any of the values in the object evaluate to true when passed predicate callback", ->
    result = _.some(someObj1, callback)
    expect(result).toBe(true)

  it "should return false if all values in object evaluate to false when passed predicate callback", ->
    result = _.some(someObj2, callback)
    expect(result).toBe(false)

describe "contains", ->

  containsArr = [1, 2, 3]
  containsObj = {a: 1, b: 2, c: 4}

  it "should return true if the value is in the array", ->
    result = _.contains(containsArr, 2)
    expect(result).toBe(true)

  it "should return false if the value is not in the array", ->
    result = _.contains(containsArr, 99)
    expect(result).toBe(false)

  it "should return true if the value is in the object", ->
    result = _.contains(containsObj, 2)
    expect(result).toBe(true)

  it "should return false if the value is not in the object", ->
    result = _.contains(containsObj, 99)
    expect(result).toBe(false)

describe "invoke", ->

  it "should call sort method on each element in an array and return results in an array", ->
    result = _.invoke([[5, 1, 7], [3, 2, 1]], "sort");
    expect(result).toEqual([[1, 5, 7], [1, 2, 3]])

  it "should call sort method on each value in an object and return results in an array", ->
    result = _.invoke({a: [5, 1, 7], b: [3, 2, 66]}, "sort")
    expect(result).toEqual([[1, 5, 7], [2, 3, 66]])

  it "should pass extra arguments onto method invocation", ->
    result = _.invoke(["lol"], "concat", "bbq")
    expect(result).toEqual(["lolbbq"])

describe "pluck", ->

  it "should extract property value from each object in array container", ->
    arr = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}]
    result = _.pluck(arr, 'name')
    expect(result).toEqual(["moe", "larry", "curly"])

  it "should extract property value from each object in object container", ->
    obj = {a: {name: 'moe', age: 40}, b: {name: 'larry', age: 50}, c: {name: 'curly', age: 60}}
    result = _.pluck(obj, 'name')
    expect(result).toEqual(["moe", "larry", "curly"])

describe "max", ->

  it "should return the maximum value in the container when passed into a callback", ->
    stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    result = _.max(stooges, (stooge) -> stooge.age);
    expect(result).toEqual({name: 'curly', age: 60})

  it "should return the maximum value in the container when not passed a callback", ->
    result = _.max([54, 43, 12, 455, 12])
    expect(result).toEqual(455)

  it "should evaluate to infinity if container is empty", ->
    result = _.max([], ->)
    expect(result).toEqual(Number.POSITIVE_INFINITY)

describe "min", ->

  it "should return the minimum value in the container when passed into a callback", ->
    stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    result = _.min(stooges, (stooge) -> stooge.age);
    expect(result).toEqual({name: 'moe', age: 40})

  it "should return the minimum value in the container when not passed a callback", ->
    result = _.min([54, 43, 12, 455, 12])
    expect(result).toEqual(12)

  it "should evaluate to infinity if container is empty", ->
    result = _.min([], ->)
    expect(result).toEqual(Number.POSITIVE_INFINITY)

describe "sortBy", ->
  it "should sort arrays in ascending order", ->
    result = _.sortBy([1, 2, 3, 4, 5, 6], (num) -> Math.sin(num))
    expect(result).toEqual([5, 4, 6, 3, 1, 2])

  it "should sort objects in ascending order and return contents in array", ->
    result = _.sortBy({ a: {age: 5}, b: {age: 222}, c: {age: 1}}, (value) -> value.age )
    expect(result).toEqual([{"age":1},{"age":5},{"age":222}])

describe "groupBy", ->
  it "should split a collection into sets, grouped by result of running each through the callback", ->
    result = _.groupBy([1.3, 2.1, 2.4], (num) ->  Math.floor(num))
    expect(result).toEqual({1: [1.3], 2: [2.1, 2.4]})

  it "should split a collection into sets, grouped by result of a mutual property on each object", ->
    result = _.groupBy(['one', 'two', 'three'], 'length')
    expect(result).toEqual({3: ["one", "two"], 5: ["three"]})

describe "indexBy", ->
  it "should split a collection into objects, organized by a property value or callback", ->
    stooges = [{name: 'moe', age: 40}, {name: 'larry', age: 50}, {name: 'curly', age: 60}];
    result = _.indexBy(stooges, 'age')
    expect(result).toEqual({"40": {name: 'moe', age: 40}, "50": {name: 'larry', age: 50}, "60": {name: 'curly', age: 60}})

describe "countBy", ->
  it "should split collection into groups and return a count for the number of values in each group.", ->
    result = _.countBy [1, 2, 3, 4, 5], (num) -> if num % 2 is 0 then 'even' else 'odd'
    expect(result).toEqual({odd: 3, even: 2})

describe "shuffle", ->
  it "should randomize an array of values", ->
    arr = [1, 2, 3, 4, 5, 6]
    result = _.shuffle(arr)
    expect(result).not.toEqual(arr)

  it "should randomize an object of values", ->
    obj = {a: [1,2,3], b: 'fefe', c: 242}
    result = _.shuffle(obj)
    expect(result).not.toEqual(obj)

describe "sample", ->
  it "should return a random value from the array", ->
    arr = [1,2,3,4,5,6]
    result = _.sample(arr)
    expect(result).not.toEqual(undefined)

  it "should return a random value from the object", ->
    obj = {a: 1, b: 2, c: 3}
    result = _.sample(obj)
    expect(result).not.toEqual(undefined)

  it "should return n random values from the array when passed n as an argument", ->
    arr = [1,2,3,4,5,6]
    result = _.sample(arr, 3)
    expect(result.length).toEqual(3)

