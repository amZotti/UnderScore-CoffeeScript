describe 'functions', ->
  describe '_.bind', ->
    it 'should bind a function to an object', ->
      fn = -> "Hello #{@name}"
      result = _.bind(fn, {name: "world"})
      expect(result()).toEqual("Hello world")

    it 'should partially apply single argument to function', ->
      fn = (greeting) -> "#{greeting} #{@name}"
      result = _.bind(fn, {name: 'moe'}, 'hi')
      expect(result()).toEqual('hi moe')

    it 'should partially apply multiple arguments to function', ->
      fn = (a, b, c) -> a + b + c
      result = _.bind(fn, {}, 1, 2)
      expect(result(1)).toEqual(4)


