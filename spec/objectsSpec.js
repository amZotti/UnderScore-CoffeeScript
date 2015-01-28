// Generated by CoffeeScript 1.8.0
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
    return describe('_.pick', function() {
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
  });

}).call(this);
