// Generated by CoffeeScript 1.8.0
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
          return "" + greeting + " " + this.name;
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
    return describe('memoize', function() {
      it('should return a new working function', function() {
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
  });

}).call(this);
