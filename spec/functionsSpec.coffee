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

  describe '_.bindAll', ->
    it 'should bind multiple functions to an object at once', ->
      buttonView =
        label  : 'underscore'
        onClick: -> "Clicked on #{@label}"
        onHover: -> "Hovered on #{@label}"
      _.bindAll(buttonView, 'onClick', 'onHover')
      expect(buttonView.onHover()).toEqual("Hovered on underscore")
      expect(buttonView.onClick()).toEqual("Clicked on underscore")

  describe '_.partial', ->
    it 'should prime functions with argument prior to their invocation', ->
      add = (a, b) -> a + b
      add5 = _.partial(add, 5)
      result = add5(10)
      expect(result).toEqual(15)

    it 'should accept \'_\' as an argument to denote an argument which should be filled at execution time', ->
      add = (a, b) -> a + b
      add5 = _.partial(add, '_', 5)
      result = add5(10)
      expect(result).toEqual(15)

  describe '_.memoize', ->
    it 'should return a new working function', ->
      add = (a, b) -> a + b
      add = _.memoize(add)
      result = add(1,5)
      expect(result).toEqual(6)

    it 'should cache the results of a function call and return the cached results when the same arguments are inputted', ->
      fn = _.memoize(-> Math.random())
      result = fn()
      expect(result).toEqual(fn())

  describe '_.once', ->
    it 'should return a function that only executes once', ->
      fn = _.once(-> Math.random())
      expect(fn()).not.toEqual(fn())
