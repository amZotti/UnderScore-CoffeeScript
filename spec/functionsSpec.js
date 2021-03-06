(function() {
  describe('functions', function() {
    describe('_.bind', function() {
      it('should bind a function to an object', function() {
        var fn, result;
        fn = function() {
          return "Hello " + this.name;
        };
        result = _.bind(fn, {
          name: "world"
        });
        return expect(result()).toEqual("Hello world");
      });
      it('should partially apply single argument to function', function() {
        var fn, result;
        fn = function(greeting) {
          return greeting + " " + this.name;
        };
        result = _.bind(fn, {
          name: 'moe'
        }, 'hi');
        return expect(result()).toEqual('hi moe');
      });
      return it('should partially apply multiple arguments to function', function() {
        var fn, result;
        fn = function(a, b, c) {
          return a + b + c;
        };
        result = _.bind(fn, {}, 1, 2);
        return expect(result(1)).toEqual(4);
      });
    });
    describe('_.bindAll', function() {
      return it('should bind multiple functions to an object at once', function() {
        var buttonView;
        buttonView = {
          label: 'underscore',
          onClick: function() {
            return "Clicked on " + this.label;
          },
          onHover: function() {
            return "Hovered on " + this.label;
          }
        };
        _.bindAll(buttonView, 'onClick', 'onHover');
        expect(buttonView.onHover()).toEqual("Hovered on underscore");
        return expect(buttonView.onClick()).toEqual("Clicked on underscore");
      });
    });
    describe('_.partial', function() {
      it('should prime functions with argument prior to their invocation', function() {
        var add, add5, result;
        add = function(a, b) {
          return a + b;
        };
        add5 = _.partial(add, 5);
        result = add5(10);
        return expect(result).toEqual(15);
      });
      return it('should accept \'_\' as an argument to denote an argument which should be filled at execution time', function() {
        var add, add5, result;
        add = function(a, b) {
          return a + b;
        };
        add5 = _.partial(add, '_', 5);
        result = add5(10);
        return expect(result).toEqual(15);
      });
    });
    describe('_.memoize', function() {
      it('should return a new working version of the function', function() {
        var add, result;
        add = function(a, b) {
          return a + b;
        };
        add = _.memoize(add);
        result = add(1, 5);
        return expect(result).toEqual(6);
      });
      return it('should cache the results of a function call and return the cached results when the same arguments are inputted', function() {
        var fn, result;
        fn = _.memoize(function() {
          return Math.random();
        });
        result = fn();
        return expect(result).toEqual(fn());
      });
    });
    describe('_.once', function() {
      return it('should return a version of the function that only executes once', function() {
        var fn;
        fn = _.once(function() {
          return Math.random();
        });
        return expect(fn()).not.toEqual(fn());
      });
    });
    describe('_.after', function() {
      return it('should return a version of the function that only execute once it is called count times', function() {
        var fn;
        fn = _.after(2, (function() {
          return "works";
        }));
        expect(fn()).toEqual(void 0);
        return expect(fn()).toEqual("works");
      });
    });
    describe('_.before', function() {
      return it('should return a version of the function that is only callable count times. After count calls it should return the value of the last successful call', function() {
        var fn;
        fn = _.before(3, (function(input) {
          return input;
        }));
        expect(fn("works")).toEqual("works");
        expect(fn("does not work")).toEqual("does not work");
        return expect(fn("works")).toEqual("does not work");
      });
    });
    describe('_.wrap', function() {
      return it('should return a version of the function which has a wrapper applied to it. This allows the wrapper to execute code before and after the function runs, adjust the arguments, and execute it conditionally.', function() {
        var hello;
        hello = function(name) {
          return "hello: " + name;
        };
        hello = _.wrap(hello, function(func) {
          return "before, " + (func('moe')) + ", after";
        });
        return expect(hello()).toEqual("before, hello: moe, after");
      });
    });
    describe('_.negate', function() {
      return it('should return a new negated version of the predicate function', function() {
        var isFalsy, result;
        isFalsy = _.negate(Boolean);
        result = _.find([-2, -1, 0, 1, 2], isFalsy);
        return expect(result).toEqual(0);
      });
    });
    return describe('_.compose', function() {
      return it('should return a composition of all the functions passed in. Each function consumes the return value of the last', function() {
        var exclaim, greet, result;
        greet = function(name) {
          return "hi " + name;
        };
        exclaim = function(message) {
          return message.toUpperCase();
        };
        result = _.compose(greet, exclaim)('tony');
        return expect(result).toEqual('HI TONY');
      });
    });
  });

}).call(this);
