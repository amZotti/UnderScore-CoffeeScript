(function() {
  describe('objects', function() {
    describe('_.keys', function() {
      return it('should return all of the names of the object\'s properties', function() {
        var results;
        results = _.keys({
          one: 1,
          two: 2,
          three: 3
        });
        return expect(results).toEqual(['one', 'two', 'three']);
      });
    });
    describe('_.values', function() {
      return it('should return all of the values of the object\'s properties', function() {
        var results;
        results = _.values({
          one: 1,
          two: 2,
          three: 3
        });
        return expect(results).toEqual([1, 2, 3]);
      });
    });
    describe('_.pairs', function() {
      return it('should convert an object into a list of [key, value] pairs', function() {
        var results;
        results = _.pairs({
          one: 1,
          two: 2,
          three: 3
        });
        return expect(results).toEqual([["one", 1], ["two", 2], ["three", 3]]);
      });
    });
    describe('_.invert', function() {
      return it('should return an object where the keys and values have been swapped', function() {
        var results;
        results = _.invert({
          Moe: "Moses",
          Larry: "Louis",
          Curly: "Jerome"
        });
        return expect(results).toEqual({
          Moses: "Moe",
          Louis: "Larry",
          Jerome: "Curly"
        });
      });
    });
    describe('_.functions', function() {
      return it('should return a sorted list of the names of every method in an object', function() {
        var results;
        results = _.functions(_);
        return expect(results.length).not.toEqual(0);
      });
    });
    describe('_.extend', function() {
      return it('should copy all of the properties in the source objects over to the destination object', function() {
        var results;
        results = _.extend({
          name: 'moe'
        }, {
          age: 50
        });
        return expect(results).toEqual({
          name: 'moe',
          age: 50
        });
      });
    });
    describe('_.isFunction', function() {
      return it('should return true if object is a function', function() {
        return expect(_.isFunction(alert)).toBe(true);
      });
    });
    describe('_.pick', function() {
      it('should return a copy of the object, filtered to only have values for the whitelisted keys', function() {
        var result;
        result = _.pick({
          name: 'moe',
          age: 50,
          userid: 'moe1'
        }, 'name', 'age');
        return expect(result).toEqual({
          name: 'moe',
          age: 50
        });
      });
      return it('should return a copy of the object, filtered to only have values which pass the predicate', function() {
        var result;
        result = _.pick({
          name: 'moe',
          age: 50,
          userid: 'moe1'
        }, function(value, key, object) {
          return typeof value === 'number';
        });
        return expect(result).toEqual({
          age: 50
        });
      });
    });
    describe('_.isElement', function() {
      it('should return true if object is a DOM element', function() {
        var results;
        results = _.isElement(document.getElementsByTagName('body')[0]);
        return expect(results).toBe(true);
      });
      return it('should return false if not DOM node', function() {
        expect(_.isElement('test')).toBe(false);
        expect(_.isElement([])).toBe(false);
        expect(_.isElement(32)).toBe(false);
        return expect(_.isElement({})).toBe(false);
      });
    });
    describe('_.isArray', function() {
      it('should return false if object is not an Array', function() {
        var results;
        results = (function() {
          return _.isArray(arguments);
        })();
        return expect(results).toBe(false);
      });
      return it('should return true if object is an Array', function() {
        return expect(_.isArray([1, 2, 3])).toBe(true);
      });
    });
    describe('_.isObject', function() {
      it('should return true if passed a function', function() {
        var result;
        result = _.isObject(function() {});
        return expect(result).toBe(true);
      });
      it('should return true if passed an array', function() {
        var result;
        result = _.isObject([1, 2, 3]);
        return expect(result).toBe(true);
      });
      it('should return true if passed an object', function() {
        var result;
        result = _.isObject({
          a: 1
        });
        return expect(result).toBe(true);
      });
      it('should return false if passed primitive value', function() {
        var result;
        result = _.isObject(2);
        return expect(result).toBe(false);
      });
      it('should return true if object is an Arguments object', function() {
        var result;
        result = _.isArgument((function(a, b, c) {
          return arguments;
        })(1, 2, 3));
        return expect(result).toBe(true);
      });
      return it('should return false if object is not an Arguments object', function() {
        var result;
        result = _.isArgument([1, 2, 3]);
        return expect(result).toBe(false);
      });
    });
    describe('_.omit', function() {
      it('should return a copy of the object filtered to omit the blacklisted keys passed as strings', function() {
        var result;
        result = _.omit({
          name: 'moe',
          age: 50,
          userid: 'moe1'
        }, 'userid');
        return expect(result).toEqual({
          name: 'moe',
          age: 50
        });
      });
      it('should return a copy of the object filtered to omit the blacklisted keys passed as array', function() {
        var result;
        result = _.omit({
          name: 'moe',
          age: 50,
          userid: 'moe1'
        }, ['userid']);
        return expect(result).toEqual({
          name: 'moe',
          age: 50
        });
      });
      return it('should return a copy of the object filtered to omit the values which pass the predicate', function() {
        var result;
        result = _.omit({
          a: 1,
          b: 2,
          c: 3,
          d: 4,
          e: 5,
          f: 6
        }, function(value, key) {
          return value % 2 === 0;
        });
        return expect(result).toEqual({
          a: 1,
          c: 3,
          e: 5
        });
      });
    });
    describe('_.defaults', function() {
      return it('should fill in undefined properties in object with the first value present in the list of defaults object', function() {
        var iceCream, result;
        iceCream = {
          flavor: "chocolate"
        };
        result = _.defaults(iceCream, {
          flavor: "vanilla",
          sprinkles: "lots"
        });
        return expect(result).toEqual({
          flavor: "chocolate",
          sprinkles: "lots"
        });
      });
    });
    describe('_.clone', function() {
      return it('should create a shallow-copied clone of the object', function() {
        var result;
        result = _.clone({
          name: 'moe'
        });
        return expect(result).toEqual({
          name: 'moe'
        });
      });
    });
    describe('_.has', function() {
      return it('should return a boolean indicating whether an object has the specified key', function() {
        var result;
        result = _.has({
          a: 1,
          b: 2,
          c: 3
        }, "b");
        return expect(result).toBe(true);
      });
    });
    return describe('_.moe', function() {
      return it('should return a function that will itself return the key property of any passed-in object', function() {
        var moe, result;
        moe = {
          name: 'moe'
        };
        result = _.property('name')(moe);
        return expect(result).toEqual('moe');
      });
    });
  });

}).call(this);
