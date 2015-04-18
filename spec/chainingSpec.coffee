describe "chain", ->

  stooges = [
    {name: 'curly', age: 25},
    {name: 'moe', age: 21},
    {name: 'larry', age: 23}
  ]

  youngest = _.chain(stooges)
    .sortBy((stooge) -> stooge.age)
    .map((stooge) -> "#{stooge.name} is #{stooge.age}")
    .first()

  it "should return a wrapped object", ->
    expect(typeof youngest).toEqual("object")

  it "calling value() should return result of method chaining", ->
    expect(youngest.value()).toEqual("moe is 21")


